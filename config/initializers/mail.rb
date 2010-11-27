### Local Configuration
ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.sendmail_settings = {
  :location => '/usr/sbin/sendmail',
  :arguments => '-i -t'
}
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf8"

### Online configuration
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = { 
#   :address => "smtp.gmail.com", 
#   :port => 587, 
#   # :domain => "gmwebagency.com",
#   :authentication => :plain,
#   :enable_starttls_auto => true, 
#   :user_name => "gillesmath@gmwebagency.com", 
#   :password => "good password to remove before committing"
# }
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.default_charset = "utf8"
