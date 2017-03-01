class Car < ApplicationRecord
  self.inheritance_column = nil
  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments, allow_destroy: true
  validates :type, :brand, :model, :description, :seats, presence: true
end
