class Backend::JetsController < Backend::BaseController
  authorize_resource
  before_action :find_jet, only: [:show, :edit, :update, :destroy]

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    if @jet.save
      redirect_to({ action: 'index' }, alert: "Jet created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @jet.update_attributes(jet_params)
    redirect_to({ action: 'index' }, alert: "Jet updated")
  end

  def destroy
    @jet.destroy
    redirect_to({ action: 'index' }, alert: "Jet destroyed")
  end

  def index
    jets = Jet.all
    jets = jets.index_search(params[:q]) if params[:q].present?
    jets = jets.page(paging_params[:page]).per(paging_params[:per])
    @jets = jets
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="jets_export_'+ Time.now.strftime("%d_%b_%Y") +'.xlsx"'
      }
    end
  end

  def show
  end

  private

  def find_jet
    @jet = Jet.find params[:id]
  end

  def jet_params
    params.require(:jet).permit(:brand, :type, :model, :seats, :description, :range, :luggage_capacity)
  end
end
