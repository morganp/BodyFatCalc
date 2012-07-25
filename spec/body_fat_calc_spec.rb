
require 'spec_helper'

DELTA = 0.005

describe BodyFatCalc do
  it " Fail nicely when no data supplied " do
    measurments = BodyFatCalc::Measurments.new({
    })
    measurments.bmi.should                      < 0
    measurments.jackson_pollock_3.should        < 0
    measurments.jackson_pollock_7.should        < 0
    measurments.parillio_9.should               < 0
  end
  
  it " Fail nicely when only weight supplied " do
    measurments = BodyFatCalc::Measurments.new({
      :weight    => 111.5,
    })
    measurments.bmi.should                      < 0
    measurments.jackson_pollock_3.should        < 0
    measurments.jackson_pollock_7.should        < 0
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

    measurments.bmi.should                      be_within( DELTA ).of( 34.41 )
    measurments.jackson_pollock_3.should        be_within( DELTA ).of( 29.44 )
    measurments.jackson_pollock_3_brozek.should be_within( DELTA ).of( 29.44 )
    measurments.jackson_pollock_3_siri.should   be_within( DELTA ).of( 30.53 )

    # Not enough points for Jackson Pollock 7 so it fails
     measurments.jackson_pollock_7.should       < 0

    # Not enough points for Parillio9 so it fails
    measurments.parillio_9.should               < 0
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
    measurments.jackson_pollock_3.should        be_within( DELTA ).of( 21.14 )
    measurments.jackson_pollock_3_brozek.should be_within( DELTA ).of( 21.14 )
    measurments.jackson_pollock_3_siri.should   be_within( DELTA ).of( 21.54 ) 

    # Not enough points for Jackson Pollock 7 so it fails
     measurments.jackson_pollock_7.should       < 0

    # Not enough points for Parillio9 so it fails
    measurments.parillio_9.should               < 0
  end

  it " All Calculations, Male Only " do
    measurments = BodyFatCalc::Measurments.new({
      :sex         => 'male',
      :weight      => 111.5,
      :height      => 1.8,
      :age         => 28,
      :chest       => 21,
      :midaxillary => 24,
      :bicep       => 7,
      :abdominal   => 47,
      :supailiac   => 29,
      :thigh       => 43,
      :calf        => 32,
      :subscapular => 21,
      :tricep      => 18,
      :lowerback   => 44
    })

    measurments.bmi.should                      be_within( DELTA ).of( 34.41 )
    measurments.jackson_pollock_3.should        be_within( DELTA ).of( 29.44 )
    measurments.jackson_pollock_3_brozek.should be_within( DELTA ).of( 29.44 )
    measurments.jackson_pollock_3_siri.should   be_within( DELTA ).of( 30.53 ) 
    measurments.jackson_pollock_7.should        be_within( DELTA ).of( 26.75 )
    measurments.parillio_9.should               be_within( DELTA ).of( 28.97 )
  end
end

