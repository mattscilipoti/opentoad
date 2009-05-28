# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_opentoad_session',
  :secret      => 'dbe230db01fde954726559bc7d209f15c611d318e31ba62c79e3de3e2710b4b782d89306e337c2652eb72a8b6437bde616935c74778e78b831283c9e163559c2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
