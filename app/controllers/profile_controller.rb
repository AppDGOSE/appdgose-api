# -*- coding: utf-8 -*-
# ProfileController maneja las llamadas relacionadas con la informacion general del usuario.
#
class ProfileController < ApplicationController
  respond_to :json

  #
  # @return Reponse con la información general del usuario o un mensaje de error si no se encontraro.
  #
  def show
    profile = Profile.find_by_cuenta(current_user.account_number)
    
    if profile.nil?
      render json: Profile.json_error, status: 404
    else
      render json: profile      
    end
  end
end
