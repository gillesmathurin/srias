ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = { 
  :address => "smtp.gmail.com", 
  :port => 587, 
  # :domain => "gmwebagency.com",
  :authentication => :plain,
  :enable_starttls_auto => true, 
  :user_name => "gillesmath@gmwebagency.com", 
  # :password => "mettre le bon mot de passe"
}
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "iso-8859-1"
