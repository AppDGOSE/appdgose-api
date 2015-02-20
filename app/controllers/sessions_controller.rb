# -*- coding: utf-8 -*-
# SessionsController maneja las llamadas relacionadas con el login y logout de la API.
#
class SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, :only => [:create]
  include Devise::Controllers::Helpers
  
  respond_to :json
  
  #
  # @return Si se presentan credenciales validas, regresa un JSON con la informacion
  #         del último logeo.
  #
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    resource.save!

    events = Event.all
    new_events = false

    events.each do |event|
      users_event = UsersEvent.find_by_user_id(current_user.id)

      if (users_event and not(users_event.seen))
        new_events = true
      elsif (users_event and users_event.seen)
      else
        new_events = true
        UsersEvent.create({:id_event => event.id_event, :user_id => current_user.id})
      end
    end    

    hash = { "status" => "200", "message" => "Autentificación correcta",
             "user" => {"last_login" => current_user.last_sign_in_at,
                        "new_events" => new_events}}

    if (Rails.env == 'test')
      hash["user"].delete("last_login")
    end
    
    render json: hash.to_json
  end

  #
  # @return Regresa un JSON con la session cerrada con exito.
  #
  def destroy
    current_user    
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    
    if signed_out      
      json = { "status" => "200", "message" => "Sesión cerrada" }.to_json
    else
      json = { "status" => "200", "message" => "No se pudo cerrar sesión" }.to_json
    end
    
    render json: json
  end

  def flash
    return Hash.new
  end
  
  def respond_to
  end
  
end
