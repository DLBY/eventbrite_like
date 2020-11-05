class EventPicturesController < ApplicationController
  def create
  @event = Event.find(params(params_event)
  @event.event_picture.attach(params[:event_picture])
  redirect_to(event_path(@event))
  end

  private

  def params_picture
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end

end
