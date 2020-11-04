class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params_event)
    @event.event_admin_id = current_user.id

    if @event.save
      redirect_to event_path(@event.id)
      flash[:success] = "Ton évenement a bien été créé !"
    else render 'new'
    end
  end

  private

  def params_event
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
  
end
