##send_mail.rb
ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "gloopt.com",
  :authentication => :plain,
  :user_name => "bob@easyunsubscriber.com",
  :password => "Bobby222"
}
