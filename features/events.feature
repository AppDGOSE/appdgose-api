Feature: Events

    Background:
      Given I send and accept JSON

    Scenario: Successful events feed
     
	  Given I am a user with account_number "072101030" and password "apidgosepassword" and email "apidgose@gmail.com"
     

	  Given a event with id_event "49" and name_event "ENCUENTRO EN MEXICO 2010 CONTRUYENDO FUTUROS" and date_event_start "2010-10-19 00:00:00" and date_event_end "2010-10-22 00:00:00" and place_event "CENTRO CULTURAL UNIVERSITARIO TLATELOLCO DE LA UN?" and url_event "www.becarios.unam.mx/Sistemas/Eventos/encuentrome?" and alias_event "registro.php"

	  When I authenticate as the user "072101030" with the password "apidgosepassword"
     
	  And I send a POST request to "/users/sign_in"
     
	  Then the response status should be "200"
     
	  And the JSON response should be:
	  """
	  	{
		  "status": "200",
		  "message":"Autentificación correcta",
          "user": { "new_events": true }
		}
	  """


      Then I send a GET request to "/events/"
      Then the response status should be "200"
      And the JSON response should be:
      """
	  {
	  "status":"200",
	   "message":"events feed",
	    "events": [
		           {"title": "ENCUENTRO EN MEXICO 2010 CONTRUYENDO FUTUROS", 
				   "abstract": "",
				    "date": {
							"start": "2010-10-19 00:00:00",
							 "end": "2010-10-22 00:00:00"},
				    "place": {
							 "name": "CENTRO CULTURAL UNIVERSITARIO TLATELOLCO DE LA UN?",
							  "location": ""},
				    "url": "www.becarios.unam.mx/Sistemas/Eventos/encuentrome?",
					"alias": "registro.php", 
					"email": ""}
				  ]
	  }
      """

      Scenario: Failure events when not login
        Then I send a GET request to "/events/"
        Then the response status should be "401"
		And the JSON response should be:
		"""
		{
				"status": "401",
				"message": "Credenciales inválidas"
		 }
		"""
