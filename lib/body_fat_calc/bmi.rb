module BodyFatCalc
  class BMI

    def initialize( measurments )
      @measurments = measurments
    end

    def valid?
      errors       = []
      requirements = ['weight', 'height']

      requirements.each do |measurment|
        unless @measurments.respond_to?( measurment )
          errors << measurment
        end
      end

      if errors.any?
        $stderr.puts "BMI is missing " + errors.join(', ')
      end

      return errors.empty?
    end


    def body_fat
      if valid?
        ( @measurments.weight.to_f / ( @measurments.height**2 ) )
      else
        -1
      end
    end

  end
end
