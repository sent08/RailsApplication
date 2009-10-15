# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_AttendanceSheet_session',
  :secret      => 'ac1556ae7d99407d74e8832e503e18bca31d5eacba93c697873dbf33e04d146aeea8eabe7211a53ff93af230ea0c7f8091b3aff7704df7e22477c9c98a5fb85a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
