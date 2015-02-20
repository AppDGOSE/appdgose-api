Feature: Events

    Background:
      Given I send and accept JSON

    Scenario: New events and seen those events
     
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


      Then I send a POST request to "/events/seen"
      Then the response status should be "200"
      And the JSON response should be:
      """
	  {
	  "status":"200",
	   "message":"events updated"
      }      
      """

      When I authenticate as the user "072101030" with the password "apidgosepassword"
     
	  And I send a POST request to "/users/sign_in"
     
	  Then the response status should be "200"
     
	  And the JSON response should be:
	  """
	  	{
		  "status": "200",
		  "message":"Autentificación correcta",
          "user": { "new_events": false }
		}
	  """

          Scenario: No new events and seen those events
     
	  Given I am a user with account_number "072101030" and password "apidgosepassword" and email "apidgose@gmail.com"     

	  When I authenticate as the user "072101030" with the password "apidgosepassword"
     
	  And I send a POST request to "/users/sign_in"
     
	  Then the response status should be "200"
     
	  And the JSON response should be:
	  """
	  	{
		  "status": "200",
		  "message":"Autentificación correcta",
          "user": { "new_events": false }
		}
	  """


      Then I send a POST request to "/events/seen"
      Then the response status should be "200"
      And the JSON response should be:
      """
	  {
	  "status":"200",
	   "message":"events updated"
      }      
      """

      When I authenticate as the user "072101030" with the password "apidgosepassword"
     
	  And I send a POST request to "/users/sign_in"
     
	  Then the response status should be "200"
     
	  And the JSON response should be:
	  """
	  	{
		  "status": "200",
		  "message":"Autentificación correcta",
          "user": { "new_events": false }
		}
	  """



      Scenario: Failure events/seen when not login
        Then I send a POST request to "/events/seen"
        Then the response status should be "401"
		And the JSON response should be:
		"""
		{
				"status": "401",
				"message": "Credenciales inválidas"
		 }
		"""
