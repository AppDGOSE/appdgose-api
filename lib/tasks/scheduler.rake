desc "This task is called by the Heroku scheduler add-on"
task :scheduler => :environment do
  puts "Updating feed..."

  accounts = Login.find(:all, :select => "cuenta")
  users = User.find(:all, :select => "account_number")

  accounts = accounts.map{|x| x.cuenta}
  users = users.map{|x| x.account_number}

  new_users_account = accounts - users

  new_users_account.each do
    |account_number|

    password = Login.find_by_cuenta(account_number).birth_date
    email = Profile.find_by_cuenta(account_number).email_unam

    begin
      user = User.create!(account_number: account_number, password: password, email: email)
    rescue
      puts "El becario #{account_number}, ya existe en la base de datos o el email #{email} esta repetido"
    end
  end

  puts "done."
end
