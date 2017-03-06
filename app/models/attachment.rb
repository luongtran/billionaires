class Attachment < ApplicationRecord
  belongs_to :attachmentable, polymorphic: true
  has_attached_file :file,
    styles: {
      original:{
        geometry: "2048x2048>"
        },
      medium: {
        geometry: "500x500>"
        },
      thumb: {
        geometry: "150x150>"
        },
    }
  #=================================================================================================
  # VALIDATIONS
  #=================================================================================================
  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /\Aimage/
  validates_attachment_file_name :file, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :file, less_than: 10.megabytes
end
