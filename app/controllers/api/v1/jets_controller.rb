class Api::V1::JetsController < Api::BaseController
  before_action :authenticate_user!

  # ==== INPUT ====
  # two_way, from, to, departure, pax, time
  # ==== OUTPUT ====
  # listing jets fiting range, seat, location, available in time
  def search

  end

end
