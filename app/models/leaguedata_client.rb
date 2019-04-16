class LeaguedataClient
  # include ActiveModel::Model

  def fetch_free_champs
    champ_lotation_url = "https://jp1.api.riotgames.com/lol/platform/v3/champion-rotations"
    fetch_data champ_lotation_url
  end

  def find_by_sn(summoner_name)
    stripped_sn = summoner_name.gsub(/[[:space:]]/, '')
    summoner_url = "https://jp1.api.riotgames.com//lol/summoner/v4/summoners/by-name/#{CGI.escape(stripped_sn)}"
    fetch_data summoner_url
  end

  def fetch_position(id)
    league_url = "https://jp1.api.riotgames.com/lol/league/v4/positions/by-summoner/#{id}"
    fetch_data league_url
  end

  def fetch_data(api_url)
    key = ENV["RIOT_API_KEY"]
    url = api_url + "?api_key=#{key}"
    uri = URI.parse(url)
    return_data = Net::HTTP.get(uri)
    JSON.parse(return_data)
  end
end