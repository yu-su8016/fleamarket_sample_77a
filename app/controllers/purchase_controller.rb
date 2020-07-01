class PurchaseController < ApplicationController
  def  done
    @item_purchaser= Item.find(params[:id])
    @item_purchaser.update( buyer_id: current_user.id)
  end
end
