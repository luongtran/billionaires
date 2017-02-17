class User < ApplicationRecord
  VALID_ROLES = %w(admin user customer editor).freeze
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  #=================================================================================================
  # ASSOCCIATIONS
  #=================================================================================================
  has_many :devices, dependent: :destroy
  #=================================================================================================
  # VALIDATIONS
  #=================================================================================================
  validates :role, inclusion: VALID_ROLES
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

end
