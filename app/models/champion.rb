class Champion < ApplicationRecord
  validates :name, presence: true 
  validates :champ_key, presence: true

  class << self
    def load
      uri = URI.parse("http://ddragon.leagueoflegends.com/cdn/8.24.1/data/en_US/champion.json")
      return_data = Net::HTTP.get(uri)
      json_data = JSON.parse(return_data)
      json_data["data"].each do |key, champ|
        Champion.create(name: champ["name"], champ_key: champ["key"])
      end
    end
  end
end
