module BodyFatCalc
  class Parillio9

    def initialize( measurments)
      @measurments = measurments
    end

    def valid?
      errors      = []
      requirements = [
        'weight', 
        'chest',       'bicep',   'abdominal', 
        'supailiac',   'thigh',   'calf',
        'subscapular', 'tricep',  'lowerback'
      ]

      requirements.each do |measurment|
        unless @measurments.respond_to?( measurment )
          errors << measurment
        end
      end

      if errors.any?
        $stderr.puts "Parillio 9 is missing " + errors.join(', ')
      end

      return errors.empty?
    end


    def body_fat
      if valid?
        percentage = ( (sum / (@measurments.weight.to_i * 2.2)) * 27 ) 

        # Catch divide by Zero
        percentage = -1 unless percentage.finite?
        return percentage
      else
        -1
      end
    end

    def sum
      return (@measurments.chest.to_i +
              @measurments.bicep.to_i +
              @measurments.abdominal.to_i +
              @measurments.supailiac.to_i +
              @measurments.thigh.to_i +
              @measurments.calf.to_i +
              @measurments.subscapular.to_i +
              @measurments.tricep.to_i + 
              @measurments.lowerback.to_i
             )
    end

  end
end

