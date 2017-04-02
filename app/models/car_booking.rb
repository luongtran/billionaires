class CarBooking < ApplicationRecord
  STATUS = %w(new assigned intransit delivered successed failed cancelled)
  #=================================================================================================
  # ASSOCCIATIONS
  #=================================================================================================
  belongs_to :car
  belongs_to :user

  before_create :default_values
  #=================================================================================================
  # METHODS
  #=================================================================================================
  def calculate_price
  end

  def default_values
    self.status ||= "new"
  end
end
