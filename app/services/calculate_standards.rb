class CalculateStandards < ApplicationService
  MALE_METABOLIC_MULTI = { common: 88.36, weight: 13.4, height: 4.8, age: 5.7 }.freeze
  FEMALE_METABOLIC_MULTI = { common: 447.6, weight: 9.2, height: 3.1, age: 4.3 }.freeze
  MODIFIERS = { 1 => 1.2, 2 => 1.375, 3 => 1.725, 4 => 1.9 }.freeze

  attr_reader :age, :sex, :weight, :height, :activity
  attr_accessor :coefficients

  def initialize(profile)
    @profile = profile
    @age = @profile.age
    @sex = @profile.sex
    @weight = @profile.weigh
    @height = @profile.height
    @activity = MODIFIERS[@profile.activity]
  end

  def call
    coefficients = sex == 1 ? MALE_METABOLIC_MULTI : FEMALE_METABOLIC_MULTI
    @profile.update(BMR: calculate.round)
    Success(@profile)
  end

  private
  def male?
    sex == 1
  end
  
  def female?
    sex == 2
  end
  def calculate
    coefficients = male? ? MALE_METABOLIC_MULTI : FEMALE_METABOLIC_MULTI
    (coefficients[:common] + (coefficients[:weight] * weight) + (coefficients[:height] * height) - (coefficients[:age] * age)) * activity
  end

end
