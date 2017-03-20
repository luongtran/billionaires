class CarBooking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  def calculate_price
  end
end
