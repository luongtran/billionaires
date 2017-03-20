class Car < ApplicationRecord
  self.inheritance_column = nil
  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments, allow_destroy: true
  validates :type, :brand, :model, :description, :seats, presence: true
  has_and_belongs_to_many :cities
  before_create :default_values

  def long_name
    [brand, model].join(" ")
  end

  private

  def default_values
    self.price_per_miles ||= 9
  end
end
