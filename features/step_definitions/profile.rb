Given(/^a profile with cuenta "(.*?)" and last_name_pat "(.*?)" and last_name_mat "(.*?)" and first_name "(.*?)" and email_unam "(.*?)" and email_comercial "(.*?)" and curp "(.*?)" and direct_phone "(.*?)" and mobile_phone "(.*?)" and code_school "(.*?)" and desc_code_school "(.*?)" and code_major "(.*?)" and desc_code_major "(.*?)" and code_bank "(.*?)" and desc_code_bank "(.*?)" and bank_acct "(.*?)" and code_prog_beca "(.*?)" and desc_code_prog_beca "(.*?)" and status_beca "(.*?)" and desc_status_beca "(.*?)" and current_cicle "(.*?)"$/) do
  |cuenta, last_name_pat, last_name_mat, first_name, email_unam, email_comercial, curp, direct_phone, mobile_phone, code_school, desc_code_school, code_major, desc_code_major, code_bank, desc_code_bank, bank_acct, code_prog_beca, desc_code_prog_beca, status_beca, desc_status_beca, current_cicle|
  Profile.create!(cuenta: cuenta, last_name_pat: last_name_pat, last_name_mat: last_name_mat,
                  first_name: first_name, email_unam: email_unam, email_comercial: email_comercial,
                  curp: curp, direct_phone: direct_phone, mobile_phone: mobile_phone,
                  code_school: code_school, desc_code_school: desc_code_school , code_major: code_major,
                  desc_code_major: desc_code_major, code_bank: code_bank, desc_code_bank: desc_code_bank,
                  bank_acct: bank_acct, code_prog_beca: code_prog_beca, desc_code_prog_beca: desc_code_prog_beca,
                  status_beca: status_beca, desc_status_beca: desc_status_beca, current_cicle: current_cicle)
end
