class State < ApplicationRecord
  has_many :cities
  has_one  :location, as: :locatable
  accepts_nested_attributes_for :cities, allow_destroy: true
  accepts_nested_attributes_for :location, allow_destroy: true
  after_create :create_location

  def create_location
    self.build_location.save
  end
end
