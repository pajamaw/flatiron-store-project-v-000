class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end
end
