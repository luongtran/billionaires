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
    }, default_url: ApplicationController.helpers.asset_path("missing.jpg")
  #=================================================================================================
  # VALIDATIONS
  #=================================================================================================
  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /\Aimage/
  validates_attachment_file_name :file, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :file, less_than: 10.megabytes

  def original_url
    file.url
  end

  def medium_url
    file.url(:medium)
  end

  def thumb_url
    file.url(:thumb)
  end

  def full_original_asset_url
    "#{ActionController::Base.asset_host}#{original_url}"
  end

  def full_medium_url
    "#{ActionController::Base.asset_host}#{medium_url}"
  end

  def full_thumb_url
    "#{ActionController::Base.asset_host}#{thumb_url}"
  end

end
