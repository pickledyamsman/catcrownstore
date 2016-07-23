class CrownsController < ApplicationController

  def index
    @crowns = Crown.all
  end

  def show
    @crown = Crown.find(params[:id])
    @cart_action = @crown.cart_action current_user.try :id
  end
  
end
