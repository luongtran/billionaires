class Api::V1::JetBookingsController < Api::BaseController
  before_action :authenticate_user!
  before_action :set_api_v1_jet_booking, only: [:show, :edit, :update, :destroy]


  # GET /api/v1/jet_bookings/1
  # GET /api/v1/jet_bookings/1.json
  def show
  end

  # GET /api/v1/jet_bookings/new
  def new
    @api_v1_jet_booking = JetBooking.new
  end

  # GET /api/v1/jet_bookings/1/edit
  def edit
  end

  # POST /api/v1/jet_bookings
  # POST /api/v1/jet_bookings.json
  def create
    @jet_booking = current_user.jet_bookings.new(api_v1_jet_booking_params)

    respond_to do |format|
      if @jet_booking.save
        format.html { redirect_to @api_v1_jet_booking_url(@jet_booking), notice: 'Jet booking was successfully created.' }
        format.json { render :show, status: :created, location: api_v1_jet_booking_url(@jet_booking) }
      else
        format.html { render :new }
        format.json { render json: @jet_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/jet_bookings/1
  # PATCH/PUT /api/v1/jet_bookings/1.json
  def update
    respond_to do |format|
      if @jet_booking.update(api_v1_jet_booking_params)
        format.html { redirect_to @jet_booking, notice: 'Jet booking was successfully updated.' }
        format.json { render :show, status: :ok, location: api_v1_jet_booking_url(@jet_booking) }
      else
        format.html { render :edit }
        format.json { render json: @jet_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/jet_bookings/1
  # DELETE /api/v1/jet_bookings/1.json
  def destroy
    @jet_booking.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_jet_booking
      @jet_booking = JetBooking.includes(:jet).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_jet_booking_params
      params.require(:jet_booking).permit(:departure_city, :arrival_city, :departure_date, :return_date, :jet_id, :passengers)
      
    end
end
