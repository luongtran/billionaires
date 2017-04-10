class City < ApplicationRecord
  belongs_to :state, dependent: :destroy
  has_and_belongs_to_many :cars
end
