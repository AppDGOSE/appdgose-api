# -*- coding: utf-8 -*-
# Event es un wrapper para la tabla vw_events.
#
class Event < ActiveRecord::Base
    self.table_name = "vw_events"
  
  #
  # @param options [Hash] Al reescribir el método no se utiliza el parametro.
  # @return [JSON] Genera un JSON que se envia como response del request /events/
  #
  def as_json(options={})
    {
      "title" => "#{name_event}",
      "abstract" => "",
      "date" => {
        "start" => "#{date_event_start}",
        "end" => "#{date_event_end}"
      },
      "place" => {
        "name" => "#{place_event}",
        "location" => ""
      },
      "url" => "#{url_event}",
      "alias" => "#{alias_event}",
      "email" => ""
    }
  end
end
