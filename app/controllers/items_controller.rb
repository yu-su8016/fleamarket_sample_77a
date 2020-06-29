class ItemsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = nil
    end
  end
  def purchase
    
  end
end
