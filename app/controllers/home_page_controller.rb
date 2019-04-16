class HomePageController < ApplicationController
  def home
    all_free_champions = fetch_free_champs
    @free_champions = all_free_champions["freeChampionIds"].map { |id|
      champ = Champion.find_by(champ_key: id.to_i)
      champ.name
    }.sort
    @champ_for_new_player = all_free_champions["freeChampionIdsForNewPlayers"].map { |id| 
      champ = Champion.find_by(champ_key: id.to_i)
      champ.name
    }.sort
  end

  private
    def fetch_free_champs
      league_client = LeaguedataClient.new
      league_client.fetch_free_champs
    end
end