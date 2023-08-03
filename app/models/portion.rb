class Portion
  include Mongoid::Document
  include Mongoid::Timestamps

  field :weight, type: Float
  field :portion_modifier, type: Float

  belongs_to :meal
end
