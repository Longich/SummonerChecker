# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

p LeaguedataClient.check_latest

run Rails.application
