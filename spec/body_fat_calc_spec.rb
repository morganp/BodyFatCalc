
require 'spec_helper'

describe BodyFatCalc do
  it "should do something" do
    measurments = BodyFatCalc::Measurments.new({
      :sex       => 'male',
      :age       => 28,
      :chest     => 21,
      :abdominal => 47,
      :thigh     => 43
    })

    pollock3 = BodyFatCalc::JacksonPollock3.new( measurments )
    pollock3.body_fat_siri.should == 30.52528111457019
    pollock3.body_fat_brozek.should == 29.43647165526979
  end
end

describe BodyFatCalc do
  it "should do something" do
    measurments = BodyFatCalc::Measurments.new({
      :sex       => 'male',
      :age       => 28,
      :chest     => 16,
      :abdominal => 25,
      :thigh     => 33.5
    })

    pollock3 = BodyFatCalc::JacksonPollock3.new( measurments )
    pollock3.body_fat_siri.should == 21.536980025693595
    pollock3.body_fat_brozek.should == 21.13818155907463
  end
end

