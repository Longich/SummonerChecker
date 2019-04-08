class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def fetch_data(api_url)
    key = ENV["RIOT_API_KEY"]
    url = api_url + "?api_key=#{key}"
    uri = URI.parse(url)
    return_data = Net::HTTP.get(uri)
    JSON.parse(return_data)
  end
end
