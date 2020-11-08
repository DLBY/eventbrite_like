class Admin::EventSubmissionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @events = Event.where(validated: nil)
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
    else render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
    flash[:success] = "Évènement supprimé"
    redirect_to admin_events_path
    else
      flash[:failure] = "L'évènement n'a pas pu être supprimé"
      redirect_to admin_events_path
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(params_event)
      flash[:success] = "Validation OK !"
      redirect_to admin_event_submissions_path
    else
      redirect_to admin_event_submissions_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  private

  def params_event
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :event_picture, :validated)
  end
  
end
