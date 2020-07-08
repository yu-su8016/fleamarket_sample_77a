class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    like = Like.new(user_id: current_user.id, item_id: params[:item_id])
    like.save
  end

  def destroy
    @like.destroy
  end
 
  private
  def set_like
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
  end
end
