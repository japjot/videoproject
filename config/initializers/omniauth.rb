Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '88pva41qsz1j', 'pJE2HjkKbmDyWE9o'
end

LinkedIn.configure do |config|
  config.token = "88pva41qsz1j"
  config.secret = "pJE2HjkKbmDyWE9o"
end
