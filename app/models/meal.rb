class Meal
  include Mongoid::Document
  include Mongoid::Timestamps

  field :weight, type: Float
  field :total_kcal, type: Float
  field :total_carbohydrates, type: Float
  field :total_fat, type: Float
  field :total_proteins, type: Float
  field :standard_portion_modifier, type: Float

  has_and_belongs_to_many :products
  has_many :portions
end
