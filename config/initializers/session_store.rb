# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tiny_notes_session',
  :secret      => '7efb35f151131a7d5fa7724dfa37e4ac838c98f9b839fe35fae7decf3bc4af6de9382c232eafb0aa253cbf401450fae5cfab33a56916897b721b9929b53462fe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
