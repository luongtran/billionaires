class Backend::CarsController < Backend::BaseController
  authorize_resource
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to({ action: 'index' }, alert: "Car created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @car.update_attributes(car_params)
    redirect_to({ action: 'index' }, alert: "Jet updated")
  end

  def destroy
    @car.destroy
    redirect_to({ action: 'index' }, alert: "Jet destroyed")
  end

  def index
    cars = Car.all
    cars = cars.index_search(params[:q]) if params[:q].present?
    cars = cars.page(paging_params[:page]).per(paging_params[:per])
    @cars = cars
  end

  def show
  end

  private

  def find_car
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit(:brand, :type, :model, :seats, :power, :max_speed, :engine, :description)
  end
end
