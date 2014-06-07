Given(/^I am a user with account_number "(.*?)" and password "(.*?)" and email "(.*?)"$/) do |account_number, password, email|
  User.create!(account_number: account_number, password: password, email: email)
end
