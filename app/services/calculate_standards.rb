class CalculateStandards < ApplicationService
  MANS_METABOLIC_MULTI = { common: 88.36, weight: 13.4, height: 4.8, age: 5.7 }
  WOMANS_METABOLIC_MULTI = { common: 447.6, weight: 9.2, height: 3.1, age: 4.3 }
  MODIFIERS = { 1 => 1.2, 2 => 1.375, 3 => 1.725, 4 => 1.9 }.freeze

  attr_reader :age, :sex, :weight, :height, :activity

  def initialize(profile)
    @profile = profile
    age = @profile.age
    sex = @profile.sex
    weight = @profile.weigh
    height = @profile.height
    activity = MODIFIERS[@profile.activity]
  end

  def call
    rates = sex == 1 ? MANS_METABOLIC_MULTI : WOMANS_METABOLIC_MULTI
    @profile.update(BMR: calculate(rates).round)
    Success(@profile)
  end

  private
  def calculate(rates)
    (rates[:common] + (rates[:weight] * weight) + (rates[:height] * height) - (rates[:age] * age)) * activity
  end

end
