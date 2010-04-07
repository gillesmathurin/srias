# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_srias_session',
  :secret      => 'd6ad086506772931a2abe33695cd4585f8311e05981ac3f50718728699ca6410dd0591fb243caeff4f8a8381127fcd1d44f6722c90c664413ac3b910ffcf0e27'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
