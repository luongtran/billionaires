class Backend::JetTypesController < Backend::BaseController
  authorize_resource
  before_action :find_jet_type, only: [:show, :edit, :update, :destroy]

  def new
    @jet_type = JetType.new
  end

  def create
    @jet_type = JetType.new(jet_params)
    if @jet_type.save
      redirect_to({ action: 'index' }, alert: "JetType created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @jet_type.update_attributes(jet_params)
    redirect_to({ action: 'index' }, alert: "JetType updated")
  end

  def destroy
    @jet_type.destroy
    redirect_to({ action: 'index' }, alert: "JetType destroyed")
  end

  def index
    jet_types = JetType.all
    jet_types = jet_types.index_search(params[:q]) if params[:q].present?
    jet_types = jet_types.page(paging_params[:page]).per(paging_params[:per])
    @jet_types = jet_types
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="jet_types_export_'+ Time.now.strftime("%d_%b_%Y") +'.xlsx"'
      }
    end
  end

  def show
  end

  private

  def find_jet_type
    @jet_type = JetType.find params[:id]
  end

  def jet_params
    params.require(:jet_type).permit(:name, :description)
  end
end
