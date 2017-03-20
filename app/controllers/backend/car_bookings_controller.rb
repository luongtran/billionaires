class Backend::CarBookingsController < Backend::BaseController
  authorize_resource
  before_action :find_car_booking, only: [:show]


  def index
    car_bookings = CarBooking.all
    car_bookings = car_bookings.index_search(params[:q]) if params[:q].present?
    car_bookings = car_bookings.page(paging_params[:page]).per(paging_params[:per])
    @car_bookings = car_bookings
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="car_bookings_export_'+ Time.now.strftime("%d_%b_%Y") +'.xlsx"'
      }
    end
  end

  def show
  end

  private

  def import_params
    params.permit(:file)
  end

  def find_car_booking
    @car_booking = CarBooking.find params[:id]
  end

  def car_params
    params.require(:car_booking).permit(:car_id)
  end
end
