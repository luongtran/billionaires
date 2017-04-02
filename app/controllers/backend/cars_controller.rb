class Backend::CarsController < Backend::BaseController
  authorize_resource
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
    @cities = City.all
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      if params[:city_ids]
        @car.cities = City.where(id: params[:city_ids])
      end
      redirect_to({ action: 'index' }, alert: "Car created")
    else
      render :new
    end
  end

  def import
    if import_params[:file]
      book = SimpleSpreadsheet::Workbook.read import_params[:file].tempfile.path
      book.selected_sheet = book.sheets.first
      raise 'e'
      redirect_to({ action: 'index' }, alert: "#{datas.length} cars imported")
    else
      render text: 'K'
    end
  end

  def edit
    @cities = City.all
  end

  def update
    if @car.update_attributes(car_params)
      if params[:city_ids]
        @car.cities = City.where(id: params[:city_ids])
      end
      redirect_to({ action: 'index' }, alert: "Car updated")
    else
      render :edit, notice: "Error when update car"
    end
  end

  def destroy
    @car.destroy
    redirect_to({ action: 'index' }, alert: "Car destroyed")
  end

  def index
    cars = Car.all
    cars = cars.index_search(params[:q]) if params[:q].present?
    cars = cars.page(paging_params[:page]).per(paging_params[:per])
    @cars = cars
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="cars_export_'+ Time.now.strftime("%d_%b_%Y") +'.xlsx"'
      }
    end
  end

  def show
  end

  private

  def import_params
    params.permit(:file)
  end

  def find_car
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit(:brand, :type, :model, :seats, :power, :top_speed, :engine, :description,
      :daily_rental, :deposit, :price_per_miles, :daily_miles, :extra_price_per_mile, :fuel_on_city, :fuel_on_hightway,
      attachments_attributes: [:id, :file, :_destroy])
  end
end
