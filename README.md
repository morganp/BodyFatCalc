
BodyFatCalc
===========

Body Fat as a percentage estimates can be calculated in various ways. The simplest is BMI, other more accurate measurments are taken using skin folds (measumernts in millimeters).

This library aims to make it easy to calculate the different formulas. Depending on which measurments you have taken will depend on which formulas you can calculate.

The skin fold measurments are often followed by a number, this represents the number of skinfold measurements required. The Jackson Pollock 3 & 7 return body density the siri or brozek formulas can then be used to turn this into a body fat percentage.

Brozek seems to be reffered over siri and is therefore the default. It is also worth noting that more measurment sites should result in a more accurate result. They are all estimates though.



Formula for Pollock 3/7 from [rohan][], [gain-weight-muscle-fast][].

[Skin Fold Sites][skinfold]

[skinfold]: http://www.topendsports.com/testing/skinfold-sites.htm

[rohan]: http://www-rohan.sdsu.edu/~ens304l/skinfold.htm

[gain-weight-muscle-fast]: http://www.gain-weight-muscle-fast.com/skinfold-measurements.html

Formula Measurment Requirments
==

| Measurment | BMI | Jackson Pollock 3 | Jackson Pollock 7 | Parillio 9 | 
|:----------:|:---:|:-----------------:|:-----------------:|:----------:|
| Weight     |  Y  |                   |                   |      Y     |
| Height     |  Y  |                   |                   |            |
| [Chest][]      |     |         Y         |         Y         |      Y     |
| [Bicep][]      |     |                   |                   |      Y     |
| [Tricep][]     |     |                   |         Y         |      Y     |
| [Supailiac][]  |     |                   |         Y         |      Y     |
| [Subscapular][]|     |                   |         Y         |      Y     |
| [Midaxillary][]|     |                   |         Y         |            |
| [Abdominal][]  |     |         Y         |         Y         |      Y     |
| [Lowerback][]  |     |                   |                   |      Y     |
| [Thigh][]      |     |         Y         |         Y         |      Y     |
| [Calf][]       |     |                   |                   |      Y     |

[Chest]: http://www.topendsports.com/testing/skinfold-chest.htm
[Bicep]: http://www.topendsports.com/testing/skinfold-bicep.htm
[Tricep]: http://www.topendsports.com/testing/skinfold-tricep.htm
[Supailiac]: http://www.topendsports.com/testing/skinfold-supraspinale.htm
[Subscapular]: http://www.topendsports.com/testing/skinfold-subscapular.htm
[Midaxillary]: http://www.topendsports.com/testing/skinfold-axilla.htm
[Abdominal]: http://www.topendsports.com/testing/skinfold-abdominal.htm
[Lowerback]: http://www.topendsports.com/testing/skinfold-lower-back.htm
[Thigh]: http://www.topendsports.com/testing/skinfold-front-thigh.htm
[Calf]: http://www.topendsports.com/testing/skinfold-medial-calf.htm

EXAMPLES
========

    measurments = BodyFatCalc::Measurments.new({
      :sex       => 'male', 
      :weight    => 110.0, #(KG)
      :height    => 1.80,  #(Meters)
      :age       => 30,    #(Years)
      :chest     => 21,    #(Millimeters)
      :abdominal => 47,    #(Millimeters)
      :thigh     => 43     #(Millimeters)
    })

    puts measurments.bmi
    puts measurments.jackson_pollock_3

