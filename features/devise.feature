Feature: Devise basic operations (sign in, sign out)

    Background:
      Given I send and accept JSON

    Scenario: Successful sign in using correct account_number and correct password
      Given I am a user with account_number "123456789" and password "apidgosepassword" and email "apidgose@gmail.com"
      When I authenticate as the user "123456789" with the password "apidgosepassword"
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

	Scenario: Failure sign in using wrong account_number and correct password
	   Given I am a user with account_number "123456789" and password "apidgosepassword" and email "apidgose@gmail.com"
       When I authenticate as the user "987654321" with the password "apidgosepassword"
       And I send a POST request to "/users/sign_in"
       Then the response status should be "401"
 	   And the JSON response should be:
 	        """
			{
				"status": "401", "message": "Credenciales inválidas"
			}			
 	        """

	Scenario: Failure sign in using correct account_number and wrong password
	   Given I am a user with account_number "123456789" and password "apidgosepassword" and email "apidgose@gmail.com"
       When I authenticate as the user "123456789" with the password "password"
       And I send a POST request to "/users/sign_in"
       Then the response status should be "401"
 	   And the JSON response should be:
 	        """
			{
				"status": "401", "message": "Credenciales inválidas"
			}			
 	        """

   Scenario: Successful sign out
   		Given I am a user with account_number "123456789" and password "apidgosepassword" and email "apidgose@gmail.com"
   	 	When I authenticate as the user "123456789" with the password "apidgosepassword"
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
		Then I send a DELETE request to "/users/sign_out"
		Then the response status should be "200"
		And the JSON response should be:
		"""
		{"status":"200", "message":"Sesión cerrada"}
		"""

    Scenario: Failure sign out
 		When I send a DELETE request to "/users/sign_out"
 		And the response status should be "200"
 		And the JSON response should be:
 		"""
 		 {"status": "200", "message": "No se pudo cerrar sesión"}
 		"""
