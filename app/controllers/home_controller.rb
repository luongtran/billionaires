class HomeController < ApplicationController

  def welcome
    render layout: 'devise'
  end

end
