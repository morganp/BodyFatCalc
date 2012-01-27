module BodyFatCalc
  class BMI

    def initialize( measurments )
      @measurments = measurments
    end
    
    def body_fat
      ( @measurments.weight.to_f / ( @measurments.height**2 ) )
    end

  end
end