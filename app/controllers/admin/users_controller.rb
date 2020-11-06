class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to admin_users_path
    else
      flash[:failure] = "L'utilisateur n'a pas pu être supprimé"
      redirect_to admin_users_path
    end
  end


  
end
