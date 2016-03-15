class CartsController < ApplicationController
  
  def show
    @user = current_cart
  end

  def checkout
    @cart = current_user.current_cart
    @cart.status = "submitted"
    @cart.line_items.each do |line_item|
      line_item.item.inventory -=  line_item.quantity
      line_item.item.save
    end
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
