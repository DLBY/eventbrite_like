class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @event_admin = Event.all
  end
end
