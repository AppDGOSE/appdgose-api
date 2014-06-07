# -*- coding: utf-8 -*-
# Login es un wrapper para la tabla vw_login, la cual contiene las cuentas y las contraseñas de la base de datos.
#
class Login < ActiveRecord::Base
    self.table_name = "vw_login"
end
