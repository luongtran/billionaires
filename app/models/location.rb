class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true, dependent: :destroy
  acts_as_mappable
end
