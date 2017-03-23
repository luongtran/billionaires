class Backend::StatesController < Backend::BaseController
  authorize_resource
  before_action :find_state, only: [:show, :edit, :update, :destroy]

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      redirect_to({ action: 'index' }, alert: "State created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @state.update_attributes(state_params)
    redirect_to({ action: 'index' }, alert: "State updated")
  end

  def destroy
    @state.destroy
    redirect_to({ action: 'index' }, alert: "State destroyed")
  end

  def index
    states = State.all
    states = states.index_search(params[:q]) if params[:q].present?
    states = states.page(paging_params[:page]).per(paging_params[:per])
    @states = states
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  private

  def import_params
    params.permit(:file)
  end

  def find_state
    @state = State.find params[:id]
  end

  def state_params
    params.require(:state).permit(:name, cities_attributes: [:id, :name, :_destroy])
  end
end
