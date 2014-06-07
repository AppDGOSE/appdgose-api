# -*- coding: utf-8 -*-
class CustomAuthFailure < Devise::FailureApp
  def respond
    self.status = 401 
    self.content_type = 'json'
    self.response_body = {"status" => "401","message" => "Credenciales inválidas"}.to_json
  end 
end
