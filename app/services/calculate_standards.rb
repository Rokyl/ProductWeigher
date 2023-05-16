require 'dry/monads'
class CalculateStandards
  include Dry::Monads[:result]

  def initialize(profile_id)
    @profile = profile_find(profile_id)
    @age = @profile.age
    @sex = @profile.sex
    @weight = @profile.weigh
    @height = @profile.height
    @activity_multiplier = @profile.activity
  end

  def call
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
    profile = Profile.find(profile_id)

    if profile
      Success(profile)
    else
      Failure(:profile_not_found)
    end
  end

  def mans_metabolic_rate
    (88.36 + (13.4 * @weight) + (4.8 * @height) - (5.7 * @age)) * @activity_multiplier
  end

  def womens_metabolic_rate
    (447.6 + (9.2 * @weight) + (3.1 * @height) - (4.3 * @age)) * @activity_multiplier
  end
end
