module BodyFatCalc
  class JacksonPollock3
    def initialize( measurments, conversion=:brozek)
      @measurments = measurments
      @conversion  = conversion
    end

    def valid?
      errors      = []
      requirements = [
        'chest',       'abdominal',   'thigh',
      ]

      requirements.each do |measurment|
        unless @measurments.respond_to?( measurment )
          errors << measurment
        end
      end

      if errors.any?
        $stderr.puts "Jackson Pollock 3 is missing " + errors.join(', ')
      end

      return errors.empty?
    end

    def body_fat
      if valid?
        if @conversion == :brozek
          return body_fat_brozek
        else 
          return body_fat_siri
        end
      else 
        -1
      end
    end

    def body_fat_siri
      # siri   = ( 495  / number) - 450
      ((495 / body_density ) - 450)
    end

    def body_fat_brozek
      # brozek = (( 4.57 / number) - 4.142) * 100
      (((4.57 / body_density ) - 4.142) * 100)
    end

    def body_density
      # Male Constants
      if @measurments.male?
        constant_x    = 1.10938
        sum_constant  = 0.0008267
        sum2_constant = 0.0000016
        age_constant  = 0.0002574
      else
        constant_x    = 1.0994921
        sum_constant  = 0.0009929
        sum2_constant = 0.0000023
        age_constant  = 0.0001392
      end


      density = constant_x - (sum_constant * sum) + (sum2_constant * sum**2) - (age_constant * @measurments.age.to_i)
    end

    def sum
      @measurments.chest.to_i + @measurments.abdominal.to_i + @measurments.thigh.to_i
    end

  end
end

