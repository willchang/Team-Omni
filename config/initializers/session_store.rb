# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Team-Omni_session',
  :secret      => 'd92be25c014786a3385f0f62738eeaa1b676c1ce2716272ef8efbf9b0799927900e6c3ba74432e8b6b1c51402dd96d2b8481ea7cdfe9e50d5c73a9326aedab34'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
