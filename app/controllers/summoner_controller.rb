class SummonerController < ApplicationController
  def show
    summoner_name = params[:summoner_name]
    if summoner_name == nil
      flash[:caution] = 'no summoner matches.'
      redirect_to root_url
    end
    league_client = LeaguedataClient.new
    @summoner = league_client.find_by_sn(summoner_name)
    rank_data = league_client.fetch_position(@summoner["id"])[0]
    if rank_data.nil? 
      @rank_data = {"tier" => 'Unrank', "rank" => '', "wins" => '', "losses" => ''}
    else
      @rank_data = rank.data
    end
  end

end
