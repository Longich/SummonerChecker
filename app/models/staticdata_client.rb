class StaticdataClient
  
  def fetch_latest_version
    uri = URI.parse("https://ddragon.leagueoflegends.com/realms/jp.json")
    return_data = Net::HTTP.get(uri)
    JSON.parse(return_data)
  end

  def fetch_champ_data(version)
    champ_url = "http://ddragon.leagueoflegends.com/cdn/#{version}/data/en_US/champion.json"
    uri = URI.parse(champ_url)
    return_data = Net::HTTP.get(uri)
    JSON.parse(return_data)
  end
end