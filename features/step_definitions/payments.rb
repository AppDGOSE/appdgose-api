Given(/^a payment calendar with cuenta "(.*?)" and jan "(.*?)" and date_jan "(.*?)" and feb "(.*?)" and date_feb "(.*?)" and march "(.*?)" and date_march "(.*?)" and april "(.*?)" and date_april "(.*?)" and may "(.*?)" and date_may "(.*?)" and june "(.*?)" and date_june "(.*?)" and jul "(.*?)" and date_jul "(.*?)" and aug "(.*?)" and date_aug "(.*?)" and sep "(.*?)" and date_sep "(.*?)" and oct "(.*?)" and date_oct "(.*?)" and nov "(.*?)" and date_nov "(.*?)" and dec "(.*?)" and date_dec "(.*?)" and current_cicle "(.*?)"$/) do
  |cuenta, jan, date_jan, feb, date_feb, march, date_march, april, date_april, may, date_may, june, date_june, jul, date_jul, aug, date_aug, sep, date_sep, oct, date_oct, nov, date_nov, dec, date_dec, current_cicle|
  
  Payment.create!(cuenta: cuenta, jan: jan, date_jan: date_jan, feb: feb, date_feb: date_feb,
                  march: march, date_march: date_march, april: april, date_april: date_april,
                  may: may, date_may: date_may, june: june, date_june: date_june, jul: jul,
                  date_jul: date_jul, aug: aug, date_aug: date_aug, sep: sep, date_sep: date_sep,
                  oct: oct, date_oct: date_oct, nov: nov, date_nov: date_nov, dec: dec,
                  date_dec: date_dec, current_cicle: current_cicle)
  
end
