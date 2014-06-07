Given(/^a event with id_event "(.*?)" and name_event "(.*?)" and date_event_start "(.*?)" and date_event_end "(.*?)" and place_event "(.*?)" and url_event "(.*?)" and alias_event "(.*?)"$/) do
  |id_event, name_event, date_event_start, date_event_end, place_event, url_event, alias_event|
  
  Event.create!(id_event: id_event, name_event: name_event, date_event_start: date_event_start,
                date_event_end: date_event_end, place_event: place_event, url_event: url_event, 
                alias_event: alias_event)

end
