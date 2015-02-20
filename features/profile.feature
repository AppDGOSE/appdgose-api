Feature: Profile

    Background:
      Given I send and accept JSON

    Scenario: Successful profile found
     
	  Given I am a user with account_number "072101030" and password "apidgosepassword" and email "apidgose@gmail.com"
      
	  Given a profile with cuenta "072101030" and last_name_pat "GARCIA" and last_name_mat "ESPINOSA" and first_name "JAIME" and email_unam "jaimege@hotmail.com" and email_comercial "jaimege@hotmail.com" and curp "" and direct_phone "55819081" and mobile_phone "0445536645855" and code_school "19" and desc_code_school "FACULTAD DE PSICOLOGIA" and code_major "210" and desc_code_major "PSICOLOGIA" and code_bank "2" and desc_code_bank "BANAMEX" and bank_acct "8548730346581998" and code_prog_beca "1" and desc_code_prog_beca "PRONABES" and status_beca "1" and desc_status_beca "Becario Activo" and current_cicle "2011-2012"
      
	  When I authenticate as the user "072101030" with the password "apidgosepassword"
     
	  And I send a POST request to "/users/sign_in"
     
	  Then the response status should be "200"
     
	  And the JSON response should be:
	  """
	  	{
		  "status": "200",
		  "message":"Autentificación correcta",
           "user": { "last_login": "2014-01-01 00:00:00 +0500" }
		}
	  """


      Then I send a GET request to "/profile/"
      Then the response status should be "200"
      And the JSON response should be:
      """
      {
         "status": "200",
         "message": "profile found",
         "profile": {
        		 "student_number": "072101030",
        		 "name": "JAIME GARCIA ESPINOSA",
				 "email": {
						"unam":"jaimege@hotmail.com",
            	 		"com":"jaimege@hotmail.com"
        				},
        		 "curp": "",
				 "phone": {
						"direct": "55819081",
            			"mobile": "0445536645855"
        		 		},
        		 "school": "FACULTAD DE PSICOLOGIA",
        		 "major": "PSICOLOGIA",
        		 "scholarship": {
						"name":"PRONABES",
            	 		"status":"Becario Activo"
        				},
                "bank": {
                        "name":"BANAMEX",
                        "account":"8548730346581998"
                        },
				"current_cycle":"2011-2012"
    			}
	  }
      """


	  Scenario: Failure profile when login but not found profile
	  			
		Given I am a user with account_number "072101030" and password "apidgosepassword" and email "apidgose@gmail.com"
		When I authenticate as the user "072101030" with the password "apidgosepassword"
     
		And I send a POST request to "/users/sign_in"
     
		Then the response status should be "200"
     
		And the JSON response should be:
	  	"""
				{
				"status": "200",
				"message":"Autentificación correcta",
				"user": { "last_login": "2014-01-01 00:00:00 +0500" }
				}
	    """


        Then I send a GET request to "/profile/"
        Then the response status should be "404"
        And the JSON response should be:
        """
			{
               "status": "404",
			   "message": "No se encuentró el perfil" 
			}
        """

      Scenario: Failure profile when not login
        Then I send a GET request to "/profile/"
        Then the response status should be "401"
		And the JSON response should be:
		"""
		{
				"status": "401",
				"message": "Credenciales inválidas"
		 }
		"""
