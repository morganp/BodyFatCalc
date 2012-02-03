#age
#Chest
#Midaxillary
#Bicep
#Abdominal
#Supailiac
#Thigh
#Calf
#Subscapular
#Tricep
#Lower back

require 'ostruct'
module BodyFatCalc
  class Measurments < OpenStruct


      def bmi
        BMI.new( self ).body_fat
      end

      def jackson_pollock_3
        JacksonPollock3.new( self ).body_fat
      end

      def jackson_pollock_3_brozek
        JacksonPollock3.new( self, :brozek ).body_fat
      end

      def jackson_pollock_3_siri
        JacksonPollock3.new( self, :siri ).body_fat
      end

      def jackson_pollock_7
        JacksonPollock7.new( self ).body_fat
      end

      def parillio_9
        Parillio9.new( self ).body_fat
      end

  end
end
