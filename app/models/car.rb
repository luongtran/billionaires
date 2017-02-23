class Car < ApplicationRecord
  self.inheritance_column = nil

  validates :type, :brand, :model, :description, :seats, presence: true

end
