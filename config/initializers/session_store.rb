# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rostovsky_session',
  :secret      => '84fbaee83f83c665d445fe07a7a310a04edf197a8080ca376f79404e0d49a87e3ceb3d68ffb49a8b9813677199a6183ba7eb94d566db9008d06b773149a5c8ce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
