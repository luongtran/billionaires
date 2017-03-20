class Api::V1::CarsController < Api::BaseController
  before_action :authenticate_user!

  # ==== INPUT ====
  # city
  # ==== OUTPUT ====
  # listing car (brand, model) with daily rental price
  def index
    if params[:city_id]
      city = City.find params[:city_id]
      @cars = city.cars
    else
      @cars = Car.all
    end
  end

  def book
    @booking = current_user.booking_car(book_params)
    unless @booking && @booking.present?
      render_bad_params 'Failed to booking', @booking.errors
    end
  end

  def distance_calculate
    gmaps = GoogleMapsService::Client.new
    matrix = gmaps.distance_matrix(calculate_params[:pick_up_address], calculate_params[:destination_address], mode: "driving")
    render_success do |json|
      json[:data] = matrix
    end
  end

  private

  def calculate_params
    params.permit(:pick_up_address, :destination_address)
  end

  def book_params
    params.permit(:car_id, :pick_up_address, :pick_up_lat, :pick_up_lng, :guests, :chauffer,
      :destination_address, :destination_lat, :destination_lng, :name, :surname, :street_address,
      :city, :state, :zip, :driver_licence, :bithrday, :state_license_was_issued, :insurance_carrier,
      :policy, :start_date, :end_date, :delivery_address, :additional_information)
  end
end
