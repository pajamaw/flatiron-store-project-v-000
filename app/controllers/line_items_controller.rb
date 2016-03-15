class LineItemsController < ApplicationController

  def create
    current_user.current_cart = Cart.create unless !!current_cart
    @line_item = current_cart.add_item(params[:item_id])
    current_cart.save
    @line_item.save
    redirect_to cart_path(current_cart)
  end
end
