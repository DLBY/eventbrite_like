class UsersController < ApplicationController
  before_action :authenticate_user!, :right_user

  def show
    @user = User.find(params[:id])
    @event_admin = Event.all
  end

private

  def right_user
    @user = User.find(params[:id])
    if current_user.id == @user.id
    else
      redirect_to root_path
  end
end
end