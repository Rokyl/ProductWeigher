require 'spec_helper'

RSpec.describe CalculateStandards, type: :service do
  let(:user) { User.new(email: "test@test.com", password: "testtest") }
  let(:profile) { Profile.new(height: 180, weight: 70, age: 18, user_id: user.id, sex: 2, activity: 2) }

  describe '#call' do
    it 'calculates bmr' do
      CalculateStandards.call(profile)
      Profile
    end
  end
end
