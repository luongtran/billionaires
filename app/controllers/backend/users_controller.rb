class Backend::UsersController < Backend::BaseController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    users = User.all
    users = users.index_search(params[:q]) if params[:q].present?
    users = users.page(paging_params[:page]).per(paging_params[:per])
    @users = users
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to({ action: 'index' }, alert: "User created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to({action: :index}, notice: 'User updated')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to({action: :index}, alert: 'User destroyed')
  end


  private

  def find_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :role)
  end

end
