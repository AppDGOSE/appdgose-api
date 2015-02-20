# -*- coding: utf-8 -*-
# PaymentsController maneja las llamadas relacionadas con los pagos.
#
class PaymentsController < ApplicationController
  respond_to :json
  
  #
  # @return Reponse con la información de los pagos o un mensaje de error si los pagos no se encontraron.
  #
  def show
    payments = Payment.find_by_cuenta(current_user.account_number)
    
    if payments.nil?
      render json: Payment.json_error, status: 404
    else
      json_payments = payments.to_json
      if (json_payments["404"]) then
        render json: json_payments, status: 404
      else
      render json: payments
      end
    end
  end
  
end
