# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_greasy_thug.net_session',
  :secret      => 'fc44d972b03bc19a03ece53f99f01961cac59dbb681febbac99e26acb4f852696c5eaab5780709100d8eaff3142c8f7dd3bad411b9325e4b3b9e7b206070165d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store