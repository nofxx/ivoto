# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_votit_session',
  :secret      => 'a73f59e6899b099c08268693e4965f757edcd4ff59ce2bcabe8671d0a9928a2fa1096b9b72c011680b063ccbd248f0b95967fd54689b5a0e1f509ba65cab9af4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
