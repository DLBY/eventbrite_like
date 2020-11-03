class ApplicationController < ActionController::Base
  require 'resolv-replace'

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
end