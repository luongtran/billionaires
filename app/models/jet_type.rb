class JetType < ApplicationRecord
  validates :name, :description, presence: true
end
