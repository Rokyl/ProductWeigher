class Ingestion
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: Integer

  has_many :portions
  belongs_to :profile
end
