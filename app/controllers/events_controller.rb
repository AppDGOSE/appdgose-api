# EventsController maneja las llamadas relacionadas con los eventos.
#
class EventsController < ApplicationController
  
  
  respond_to :json

  #
  # @return Response con todos los eventos disponibles en la DB.
  #
  def show
    events = Event.all

    render json: {
             "status" => "200",
             "message" => "events feed",
             "events" => events
           }.to_json
  end

  def update
    users_events = UsersEvent.where(user_id: current_user.id)

    users_events.each do |event|
      
      if (Event.find_by_id_event(event.id_event))
        event.seen = true
        event.save
      else
        event.destroy
      end
    end
    
    render json: {
             "status" => "200",
             "message" => "events updated"
           }.to_json
  end
end
