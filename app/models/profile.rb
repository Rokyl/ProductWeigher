class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

  field :height, type: Integer
  field :age, type: Integer
  field :weight, type: Integer
  field :sex, type: Integer
  field :region, type: String

  belongs_to :user
  has_many :ingestions

  attr_reader :BMR

  before_save :calculate_bmr

  private

  def calculate_bmr
    CalculateStandards.call(self)
  end
end
