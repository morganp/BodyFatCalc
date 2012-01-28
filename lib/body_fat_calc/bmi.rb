module BodyFatCalc
  class BMI

    def initialize( measurments )
      @measurments = measurments
    end

    def validate
      errors = []

      if @measurments.weight.nil?
        errors << "weight"
      end

      if @measurments.height.nil?
        errors << "height"
      end

      if errors.any?
        $stderr.puts "BMI requires " + errors.join(', ')
      end

      return errors.empty?
    end


    def body_fat
      if validate
        ( @measurments.weight.to_f / ( @measurments.height**2 ) )
      else
        -1
      end
    end

  end
end
