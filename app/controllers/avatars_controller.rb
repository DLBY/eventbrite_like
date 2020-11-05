class AvatarsController < ApplicationController

  def create
  @user = User.find(params[:user_id])
  @user.avatar.attach(params[:avatar])
  redirect_to(user_path(@user))
  end

  private

  def params_event
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
  
end
