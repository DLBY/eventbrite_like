class Admin::AdminController < ApplicationController
  before_action :check_if_admin
  def show
    @events = Event.all
  end
end