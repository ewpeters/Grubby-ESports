# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_grubby_session',
  :secret      => '54bb9ca557702ce0dfd89170bc690ab84ec6a218b1c5ecdd13c0ef8a5e649b79fc1795631ad4a38e712ee251dacbf9df2e7cc6f794415ba920c735b8063f695e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
