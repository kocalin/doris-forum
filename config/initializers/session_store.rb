# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_doris-forum_session',
  :secret      => '02fd7547463c18250fd2846d93677ef930b77fee03b374d417103f33435213088bfead78f346d9b4a26d7d510b135bde6e2aaa27af41877f219fa0685e76f4b0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
