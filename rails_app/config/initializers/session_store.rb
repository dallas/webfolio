# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dallasreedy.com.new_session',
  :secret      => 'eb108c96f8eec41be1abe9fce91237f98f011b2dd5724b6f94ce661cafc07a8e5ad23953ecd685f7eff55041d546e35736bafdc85a44fd47cd041dfff0f95c76'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
