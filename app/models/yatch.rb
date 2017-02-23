class Yatch < ApplicationRecord
  self.inheritance_column = nil
  validates :type, :brand, :model, presence: true
end
