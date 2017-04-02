class Api::V1::JetsController < Api::BaseController
  before_action :authenticate_user!

  # ==== INPUT ====
  # two_way, from, to, departure_date, return_date, passengers, time
  # ==== OUTPUT ====
  # listing jets (type, free slots, image) with estimate flight hours, price
  def index
    @jets = Jet.all
  end

  def book
    render_bad_params 'Not implemented yet'
  end

  private

  def search_params
    params.permit(:two_way, :from, :to, :departure_date, :return_date, :passengers, :time)
  end

end
