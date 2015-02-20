Feature: Payments

    Background:
      Given I send and accept JSON

    Scenario: Successful payments calendar
     
	  Given I am a user with account_number "072101030" and password "apidgosepassword" and email "apidgose@gmail.com"
      
	  Given a profile with cuenta "072101030" and last_name_pat "GARCIA" and last_name_mat "ESPINOSA" and first_name "JAIME" and email_unam "jaimege@hotmail.com" and email_comercial "jaimege@hotmail.com" and curp "" and direct_phone "55819081" and mobile_phone "0445536645855" and code_school "19" and desc_code_school "FACULTAD DE PSICOLOGIA" and code_major "210" and desc_code_major "PSICOLOGIA" and code_bank "2" and desc_code_bank "BANAMEX" and bank_acct "8548730346581998" and code_prog_beca "1" and desc_code_prog_beca "PRONABES" and status_beca "1" and desc_status_beca "Becario Activo" and current_cicle "2011-2012"

	  Given a payment calendar with cuenta "072101030" and jan "0" and date_jan "3 de febrero" and feb "0" and date_feb "3 de marzo" and march "0" and date_march "1 de abril" and april "0" and date_april "2 de mayo" and may "0" and date_may "2 de junio" and june "0" and date_june "1 de julio" and jul "0" and date_jul "4 de agosto" and aug "0" and date_aug "1 de septiembre" and sep "750" and date_sep "1 de octubre" and oct "750" and date_oct "1 de noviembre" and nov "750" and date_nov "2 de diciembre" and dec "0" and date_dec "20 de diciembre" and current_cicle "2013-2014"

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


      Then I send a GET request to "/payments/"
      Then the response status should be "200"
      And the JSON response should be:
      """
      {
      "status" : "200",
      "message" : "payments calendar",
      "payments" : {
				   "calendar" : [
            	   			  {"month" : "Enero", "amount" : "0",  "done" : "3 de febrero", "status" : "Sin realizar"},
							  {"month" : "Febrero", "amount" : "0", "done" : "3 de marzo", "status" : "Sin realizar"},
							  {"month" : "Marzo", "amount" : "0", "done" : "1 de abril", "status" : "Sin realizar"},
            				  {"month" : "Abril", "amount" : "0", "done" : "2 de mayo", "status" : "Sin realizar"},
            				  {"month" : "Mayo", "amount" : "0", "done" : "2 de junio", "status" : "Sin realizar"},
            				  {"month" : "Junio", "amount" : "0", "done" : "1 de julio", "status" : "Sin realizar"},
            				  {"month" : "Julio", "amount" : "0", "done" : "4 de agosto", "status" : "Sin realizar"},
            				  {"month" : "Agosto", "amount" : "0", "done" : "1 de septiembre", "status" : "Sin realizar"},
            				  {"month" : "Septiembre", "amount" : "750", "done" : "1 de octubre", "status" : "Realizado"},
            				  {"month" : "Octubre", "amount" : "750", "done" : "1 de noviembre", "status" : "Realizado"},
            				  {"month" : "Noviembre", "amount" : "750", "done" : "2 de diciembre", "status" : "Realizado"},
            				  {"month" : "Diciembre", "amount" : "0", "done" : "20 de diciembre", "status" : "Sin realizar"}]
      	   }
      }
      """


	  Scenario: Failure payments when login but not payments found
	  
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

      Then I send a GET request to "/payments/"
      Then the response status should be "404"
      And the JSON response should be:
      """
       {
         "status": "404",
         "message": "No se encuentraró el registro de los pagos" 
       }
	  """


      Scenario: Failure payments when not login
        Then I send a GET request to "/payments/"
        Then the response status should be "401"
		And the JSON response should be:
		"""
		{
				"status": "401",
				"message": "Credenciales inválidas"
		 }
		"""
