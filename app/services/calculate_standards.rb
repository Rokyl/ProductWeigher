# frozen_string_literal: true

class CalculateStandards < ApplicationService
  MALE_METABOLIC_MULTI = { common: 88.36, weight: 13.4, height: 4.8, age: 5.7 }.freeze
  FEMALE_METABOLIC_MULTI = { common: 447.6, weight: 9.2, height: 3.1, age: 4.3 }.freeze
  MODIFIERS = { 1 => 1.2, 2 => 1.375, 3 => 1.725, 4 => 1.9 }.freeze

  attr_reader :age, :sex, :weight, :height, :activity

  def initialize(profile)
    @profile = profile
    @age = @profile.age
    @sex = @profile.sex
    @weight = @profile.weight
    @height = @profile.height
    @activity = MODIFIERS[@profile.activity]
  end

  def call
    @profile.assign_attributes(bmr: calculate.round)
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
    (general_sex_coefficient +
      weight_coefficient +
      height_coefficient -
      age_coefficient) *
      activity
  end

  def coefficients
    @coefficients ||= male? ? MALE_METABOLIC_MULTI : FEMALE_METABOLIC_MULTI
  end

  def general_sex_coefficient
    coefficients[:common]
  end

  def weight_coefficient
    coefficients[:weight] * weight
  end

  def height_coefficient
    coefficients[:height] * height
  end

  def age_coefficient
    coefficients[:age] * age
  end
end
