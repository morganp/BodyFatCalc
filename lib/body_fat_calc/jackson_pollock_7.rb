module BodyFatCalc
  class JacksonPollock7


    def initialize( measurments)
      @measurments = measurments
    end

    def valid?
      errors      = []
      requirements = [
        'chest',       'abdominal', 
        'supailiac',   'thigh',
        'subscapular', 'tricep', 
        'midaxillary'
      ]

      requirements.each do |measurment|
        unless @measurments.respond_to?( measurment )
          errors << measurment
        end
      end

      if errors.any?
        $stderr.puts "Jackson Pollock 7 is missing " + errors.join(', ')
      end

      return errors.empty?
    end


    def body_fat
      if valid?
        return (((4.95/body_density  ) - 4.5 ) * 100 )
      else 
        return -1
      end
    end

    def body_density
      #Male Constants
      constant_x    = 1.112
      sum_constant  = 0.00043499 
      sum2_constant = 0.00000055
      age_constant  = 0.00028826

      density = constant_x - (sum_constant * sum) + (sum2_constant * sum**2) - (age_constant * @measurments.age.to_i)
    end

    def sum
      (@measurments.chest.to_i + 
        @measurments.abdominal.to_i + 
        @measurments.supailiac.to_i + 
        @measurments.thigh.to_i +
        @measurments.subscapular.to_i +
        @measurments.tricep.to_i +
        @measurments.midaxillary.to_i )
    end

  end
end

