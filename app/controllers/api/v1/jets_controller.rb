class Api::V1::JetsController < Api::BaseController
  before_action :authenticate_user!, exept: [:airports]

  # ==== INPUT ====
  # two_way, from, to, departure_date, return_date, passengers, time
  # ==== OUTPUT ====
  # listing jets (type, free slots, image) with estimate flight hours, price
  def index
    @jets = Jet.where('seats > ?', search_params[:passengers]) 
  end

  def book
    render_bad_params 'Not implemented yet'
  end

  def airports
    result = Calculator.airports(params[:query])
    render_success 'OK' do |json|
      json[:data] = result
    end
  end

  def aircraft_types
    result = Calculator.aircraft_types(params[:query])
    render_success 'OK' do |json|
      json[:data] = result
    end
  end

  def flight_calculator
    result = Calculator.flight_calculator(search_params)
    render_success 'OK' do |json|
      json[:data] = result
    end
  end

  private

  def search_params
    params.permit(:two_way, :from, :to, :departure_date, :return_date, :passengers, :time)
  end

end
