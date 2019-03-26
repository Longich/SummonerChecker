class SummonerController < ApplicationController
  def show
    summoner_name = params[:summoner_name]
    if summoner_name == nil
      flash[:caution] = 'no summoner matches.'
      redirect_to root_url
    end
    @summoner = search(summoner_name)
  end
end
