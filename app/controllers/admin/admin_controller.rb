class Admin::AdminController < ApplicationController
  
  def show
    @events = Event.all
  end
end
