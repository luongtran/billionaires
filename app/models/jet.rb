class Jet < ApplicationRecord
  self.inheritance_column = nil
  has_many :attachments, as: :attachmentable
  has_many :jet_bookings, dependent: :destroy
  
  accepts_nested_attributes_for :attachments, allow_destroy: true
  validates :type, :brand, :model, presence: true
end
