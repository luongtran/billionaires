class JetType < ApplicationRecord
  validates :name, :description, presence: true
  has_attached_file :image, style: {medium: {geometry: '500x500>'}, thumb: '150x150>'}
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_size :image, less_than: 10.megabytes
end
