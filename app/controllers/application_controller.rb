# -*- coding: utf-8 -*-
# ApplicaionController indica que antes de ejecutar cualquier método se debe autentificar al usuario que lo solicito.
#
class ApplicationController < ActionController::API
  
  include ActionController::ImplicitRender
  include ActionController::StrongParameters
  
  before_filter :authenticate_user!
end
