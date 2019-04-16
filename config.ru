# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

static_client = StaticdataClient.new
Version.new.check_latest_champ_version_and_update static_client
Champion.load static_client, Version.last[:champion]

run Rails.application
