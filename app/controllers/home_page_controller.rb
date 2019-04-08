class HomePageController < ApplicationController
  def home
    all_free_champions = fetch_free_champs
    @free_champions = all_free_champions["freeChampionIds"].map { |id|
      champ = Champion.find_by(champ_key: id.to_i)
      champ.name
    }
    @champ_for_new_player = all_free_champions["freeChampionIdsForNewPlayers"].map { |id| 
      champ = Champion.find_by(champ_key: id.to_i)
      champ.name
    }
    uri = URI.parse("http://ddragon.leagueoflegends.com/cdn/8.24.1/data/en_US/champion.json")
    return_data = Net::HTTP.get(uri)
    @data = JSON.parse(return_data)
  end

  private
    def fetch_free_champs
      league_client = LeaguedataClient.new
      league_client.fetch_free_champs
    end
end