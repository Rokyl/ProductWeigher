class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :barcode, type: Integer
  field :kcal, type: Float
  field :carbohydrates, type: Float
  field :fat, type: Float
  field :proteins, type: Float
  field :standard_portion_modifier, type: Float
  has_and_belongs_to_many :meals
end
