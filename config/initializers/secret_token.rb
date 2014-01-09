# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
TravelDeals::Application.config.secret_key_base = ENV['RAILS_SECRET'] || 'asdu231ih2b3hv12jv3g1k2lh3l1k2bv3h1v2k3j1h23lh1v2h3vj21kg312j3bg1jk2v3k12gh3j12j3v1j2hv3j1kj2g3hjb1k2v31h23kvj1g3b12jb3vh123k12g3j12bkj3v12jhv3k123v1k'
