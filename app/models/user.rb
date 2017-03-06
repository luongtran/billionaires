class User < ApplicationRecord
  include PgSearch
  pg_search_scope :index_search, :against => [:name, :surname, :email], :using => [:tsearch]
  VALID_ROLES = %w(admin user customer editor).freeze
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_attached_file :image, style: {medium: {geometry: '500x500>'}, thumb: '150x150>'}
  #=================================================================================================
  # ASSOCCIATIONS
  #=================================================================================================
  has_many :devices, dependent: :destroy
  #=================================================================================================
  # VALIDATIONS
  #=================================================================================================
  validates :role, inclusion: VALID_ROLES
  validates :phone, numericality: { only_integer: true, allow_nil: true }, on: :update
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :image, less_than: 10.megabytes
  #=================================================================================================
  # METHODS
  #=================================================================================================
  (VALID_ROLES).each do |role|
    define_method("#{role}?") do
      self.role == role
    end
    scope role, -> { where(role: role) }
  end

  def full_name
    [name,surname].join(' ')
  end

  def as_json
    {full_name: full_name, email: email,company_name: company_name, surname: surname, phone: phone,
      website: website, image_url: image.url}
  end
end
