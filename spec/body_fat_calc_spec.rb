
require 'spec_helper'

describe BodyFatCalc do
  it " Fail nicely when no data supplied " do
    measurments = BodyFatCalc::Measurments.new({
    })
    measurments.bmi.should                      < 0
    measurments.jackson_pollock_3.should        < 0
    measurments.parillio_9.should               < 0
  end
  
  it " Fail nicely when only weight supplied " do
    measurments = BodyFatCalc::Measurments.new({
      :weight    => 111.5,
    })
    measurments.bmi.should                      < 0
    measurments.jackson_pollock_3.should        < 0
    measurments.parillio_9.should               < 0
  end
  
    
  it " Calculate BMI and Jackson Pollock 3 " do
    measurments = BodyFatCalc::Measurments.new({
      :sex       => 'male',
      :weight    => 111.5,
      :height    => 1.80,
      :age       => 28,
      :chest     => 21,
      :abdominal => 47,
      :thigh     => 43
    })

    measurments.bmi.should                      == 34.413580246913575
    measurments.jackson_pollock_3.should        == 29.43647165526979
    measurments.jackson_pollock_3_brozek.should == 29.43647165526979
    measurments.jackson_pollock_3_siri.should   == 30.52528111457019
    #measurments.parillio_9.should               < 0
  end

  it " Jackson Pollock 3 Male Only " do
    measurments = BodyFatCalc::Measurments.new({
      :sex       => 'male',
      :age       => 28,
      :chest     => 16,
      :abdominal => 25,
      :thigh     => 33.5
    })

    measurments.bmi.should                      == -1
    measurments.jackson_pollock_3.should        == 21.13818155907463
    measurments.jackson_pollock_3_brozek.should == 21.13818155907463
    measurments.jackson_pollock_3_siri.should   == 21.536980025693595 
  end
end

