# EventsController maneja las llamadas relacionadas con los eventos.
#
class EventsController < ApplicationController
  prepend_before_filter :require_no_authentication, :only => [:show]
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
