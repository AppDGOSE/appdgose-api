# -*- coding: utf-8 -*-
# Payment es un wrapper para la tabla vw_payments, la cual contiene la información de los pagos de los becarios.
#
class Payment < ActiveRecord::Base
    self.table_name = "vw_payments"

  #
  # @param options [Hash] Al reescribir el método no se utiliza el parametro.
  # @return [JSON] Genera un JSON que se envia como response del request /payments/
  #
  def to_json(options={})
    
    profile = Profile.find_by_cuenta(cuenta)
    
    if (profile.nil?)
      Payment.json_error
    else
    
      {
        "status" => "200",
        "message" => "payments calendar",
        "payments" => {
          "bank" => {
            "name" => "#{profile.desc_code_bank}",
            "account" => "#{profile.bank_acct}"
          },
          "calendar" => [
                         {"month" => "Enero", "amount" => "#{jan}",  "done" => "#{date_jan}", "status" => "#{jan <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Febrero", "amount" => "#{feb}", "done" => "#{date_feb}", "status" => "#{feb <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Marzo", "amount" => "#{march}", "done" => "#{date_march}", "status" => "#{march <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Abril", "amount" => "#{april}", "done" => "#{date_april}", "status" => "#{april <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Mayo", "amount" => "#{may}", "done" => "#{date_may}", "status" => "#{may <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Junio", "amount" => "#{june}", "done" => "#{date_june}", "status" => "#{june <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Julio", "amount" => "#{jul}", "done" => "#{date_jul}", "status" => "#{jul <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Agosto", "amount" => "#{aug}", "done" => "#{date_aug}", "status" => "#{aug <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Septiembre", "amount" => "#{sep}", "done" => "#{date_sep}", "status" => "#{sep <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Octubre", "amount" => "#{oct}", "done" => "#{date_oct}", "status" => "#{oct <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Noviembre", "amount" => "#{nov}", "done" => "#{date_nov}", "status" => "#{nov <= 0 ? "Sin realizar" : "Realizado"}"},
                         {"month" => "Diciembre", "amount" => "#{dec}", "done" => "#{date_dec}", "status" => "#{dec <= 0 ? "Sin realizar" : "Realizado"}"}
                        ]
        }
      }.to_json
    end
  end    

  #
  # @return [JSON] Genera un JSON indicando que no se encontro un profile ni un payments para el usuario logeado.
  # 
  def self.json_error
    {
      "status" => "404",
      "message" => "No se encuentraró el registro de los pagos" 
    }.to_json
  end
end
