class HomePageController < ApplicationController
  def home
    @champions = fetchAllChamps
  end

  private
    def fetchAllChamps
    end
end