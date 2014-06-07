# -*- coding: utf-8 -*-
# User es utilizado para guardar la sesión y configuración de esta.
#
# == Options
#
# Especificamente usamos las siguientes opciones:
#
#   * :database_authenticatable Para poder utilizar el servicio deben de logearse primero.;
#   * :registerable Los nuevos usuarios se deben de registrar manualmente.;
#   * :recoverable Permite recuperar la contraseña si es que se pierde.;
#   * :rememberable  Genera cookies para guardar la sesión.;
#   * :validatable Valida que los email y password tenga un formato valido.;
#   * :timeoutable Modulo que se encarga de investigar si la sesion expiro o sigue active.;
#   * :timeout_in Duracion de cada sesion
#

class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :timeoutable, :timeout_in => 5.minutes

  #
  # @param options [Hash] Al reescribir el método no se utiliza el parametro.
  # @return [JSON] Genera un JSON que se envia como response al momento de autentificar a un usuario
  #
  def to_json(options={})
    { 
      "status" => "200",
      "message" => "Autentificación correcta",
      "user" => {
        "last_login" => "#{not(Rails.env.test?) ? last_sign_in_at.getlocal : Time.new(2014, 1, 1, 0, 0,0, "+05:00")}" 
      }
    }.to_json
  end
end
