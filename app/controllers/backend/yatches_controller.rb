class Backend::YatchesController < Backend::BaseController
  authorize_resource
  before_action :find_yatch, only: [:show, :edit, :update, :destroy]

  def new
    @yatch = Yatch.new
  end

  def create
    @yatch = Yatch.new(yatch_params)
    if @yatch.save
      redirect_to({ action: 'index' }, alert: "Yatch created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @yatch.update_attributes(yatch_params)
    redirect_to({ action: 'index' }, alert: "Yatch updated")
  end

  def destroy
    @yatch.destroy
    redirect_to({ action: 'index' }, alert: "Yatch destroyed")
  end

  def index
    yatches = Yatch.all
    yatches = yatches.index_search(params[:q]) if params[:q].present?
    yatches = yatches.page(paging_params[:page]).per(paging_params[:per])
    @yatches = yatches
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="yatches_export_'+ Time.now.strftime("%d_%b_%Y") +'.xlsx"'
      }
    end
  end

  def show
  end

  private

  def find_yatch
    @yatch = Yatch.find params[:id]
  end

  def yatch_params
    params.require(:yatch).permit(:brand, :type, :model, :seats)
  end
end
