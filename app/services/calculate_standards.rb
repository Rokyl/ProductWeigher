require 'dry/monads'
class CalculateStandards
  MODIFIERS = {1 => 1.2, 2 => 1.375, 3 => 1.725, 4 => 1.9}.freeze
  include Dry::Monads[:result]

  def initialize(id)
    @profile = profile_find(id)
    return nil unless @profile
    @age = @profile.age
    @sex = @profile.sex
    @weight = @profile.weigh
    @height = @profile.height
    @activity_multiplier = MODIFIERS[@profile.activity]
  end

  def call
    return Failure(:profile_not_found) unless @profile
    if @sex==1
      @profile.update(BMR: mans_metabolic_rate.round)
      Success(@profile)
    else
      @profile.update(BMR: womens_metabolic_rate.round)
      Success(@profile)
    end
  end

  private

  def profile_find(profile_id)
    Profile.find_by(id: profile_id)
  end

  def mans_metabolic_rate
    (88.36 + (13.4 * @weight) + (4.8 * @height) - (5.7 * @age)) * @activity_multiplier
  end

  def womens_metabolic_rate
    (447.6 + (9.2 * @weight) + (3.1 * @height) - (4.3 * @age)) * @activity_multiplier
  end
end
