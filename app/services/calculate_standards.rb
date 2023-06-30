class CalculateStandards < ApplicationService
  MODIFIERS = { 1 => 1.2, 2 => 1.375, 3 => 1.725, 4 => 1.9 }.freeze

  attr_reader age, sex, weight, height, activity

  def initialize(profile)
    @profile = profile
    @age = @profile.age
    @sex = @profile.sex
    @weight = @profile.weigh
    @height = @profile.height
    @activity_multiplier = MODIFIERS[@profile.activity]
  end

  def call
    if @sex == 1
      @profile.update(BMR: mans_metabolic_rate.round)
      Success(@profile)
    else
      @profile.update(BMR: womens_metabolic_rate.round)
      Success(@profile)
    end
  end

  private
  def mans_metabolic_rate
    (88.36 + (13.4 * @weight) + (4.8 * @height) - (5.7 * @age)) * @activity_multiplier
  end

  def womens_metabolic_rate
    (447.6 + (9.2 * @weight) + (3.1 * @height) - (4.3 * @age)) * @activity_multiplier
  end
end
