# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_leitor_session',
  :secret      => 'c98137f41cf89559b3bf1266de42d3e841d7de4086ef6fd605a681f770eafbe84ac55364510847af333dae3e4293a08bd080c54aa1fd64ba2fe935b628ba54eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
