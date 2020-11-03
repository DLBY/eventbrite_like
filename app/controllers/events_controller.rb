class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]


  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.admin_id= current_user.id

    if @event.save
      redirect_to event_path(@event.id)
      flash[:success]= "Ton évenement a bien été créé !"
    else redirect_to new_event_path
    end
  end

  private

  def params_event
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
  
end
