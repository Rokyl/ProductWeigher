class Ingestion < ApplicationRecord
  has_many :portions
  belongs_to :profile
end
