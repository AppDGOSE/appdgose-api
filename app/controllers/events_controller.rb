# EventsController maneja las llamadas relacionadas con los eventos.
#
class EventsController < ApplicationController
 skip_before_filter :authenticate_user! 
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
