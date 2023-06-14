class Profile < ApplicationRecord
  belongs_to :user
  has_many :ingestions
  attr_reader :BMR
  before_save :calculate_bmr

  private

  def calculate_bmr
    CalculateStandards.call(self.id)
  end
end
