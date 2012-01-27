module BodyFatCalc
  VERSION = '0.0.1'
end

begin
  require_relative 'body_fat_calc/measurments'
  require_relative 'body_fat_calc/bmi'
  require_relative 'body_fat_calc/jackson_pollock_3'
  require_relative 'body_fat_calc/jackson_pollock_7'
  require_relative 'body_fat_calc/parillio_9'
rescue
  require 'body_fat_calc/measurments'
  require 'body_fat_calc/bmi'
  require 'body_fat_calc/jackson_pollock_3'
  require 'body_fat_calc/jackson_pollock_7'
  require 'body_fat_calc/parillio_9'
end
