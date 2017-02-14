class HomeController < ApplicationController

  def index
    @users = User.includes(:profile).all
  end

  def deploy
    DeployJob.perform_later
    render json: {status: "OK"}
  end
end
