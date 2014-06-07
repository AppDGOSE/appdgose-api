# -*- coding: utf-8 -*-
# Profile es un wrapper para la tabla vw_info_becario, la cual contiene la información básica de los becarios.
#

class Profile < ActiveRecord::Base
    self.table_name = "vw_info_becario"
  
  #
  # @return [String] Se compone el String "first_name + last_name_pat + last_name_mat"
  #
    def name
      return "#{first_name} #{last_name_pat} #{last_name_mat}"
    end

    #
    # @param options [Hash] Al reescribir el método no se utiliza el parametro.
    # @return [JSON] Genera un JSON que se envia como response del request /profile/
    # 
    def to_json(options={})
      {
        "status" => "200",
        "message" => "profile found",
        
        "profile" => {
          "student_number" => "#{cuenta}",
          "name" => "#{name}",
          
          "email" => {
            "unam" => "#{email_unam}",
            "com" => "#{email_comercial}",
          },
          
          "curp" => "#{curp}",
          
          "phone" => {
            "direct" => "#{direct_phone}",
            "mobile" => "#{mobile_phone}",
          },
          
          "school" => "#{desc_code_school}",
          "major" => "#{desc_code_major}",
          
          "scholarship" => {
            "name" => "#{desc_code_prog_beca}",
            "status" => "#{desc_status_beca}"
          },
          "current_cycle" => "#{current_cicle}"
        }
      }.to_json
    end

    #
    # @return [JSON] Genera un JSON indicando que no se encontro ningún perfil.
    # 
    def self.json_error
      {
        "status" => "404",
        "message" => "No se encuentró el perfil" 
      }.to_json
    end
end
