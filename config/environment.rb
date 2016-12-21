# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# test-- by addign this I managed to bypass an error saying that
# my Image Uploader hadn't been initialised
require 'carrierwave/orm/activerecord'

