# EventsController maneja las llamadas relacionadas con los eventos.
#
class EventsController < ApplicationController
  respond_to :json
  
  #
  # @return Response con todos los eventos disponibles en la DB.
  # 
  def show
    events = Event.all

    render json: 
      {
      "status" => "200",
      "message" => "events feed",
      "events" => events
    }.to_json
  end
end
