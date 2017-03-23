class State < ApplicationRecord
  has_many :cities
  has_one  :location, as: :locatable
  accepts_nested_attributes_for :cities, allow_destroy: true
end
