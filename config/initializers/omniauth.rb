Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '88pva41qsz1j', 'pJE2HjkKbmDyWE9o'
end

LinkedIn.configure do |config|
  config.token = "88pva41qsz1j"
  config.secret = "pJE2HjkKbmDyWE9o"
end

LinkedIn::Client.class_eval do 
# options should be a hash like this:
# options = {:recipients => {:values => [:person => {:_path => "/people/~" }, :person =>   {:_path => "/people/USER_ID"} ]}, :subject => "Something",:body => "To read" }
  def send_message(options)
    path = "/people/~/mailbox"
    post(path, options.to_json, "Content-Type" => "application/json")
  end
end 