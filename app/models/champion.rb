class Champion < ApplicationRecord
  validates :name, presence: true 
  validates :champ_key, presence: true

  class << self
    def load(static_client, version)
      json_data = static_client.fetch_champ_data version
      json_data["data"].each do |key, champ|
        if (champion = Champion.find_by(champ_id: key)) 
          champion.update(name: champ["name"], champ_key: champ["key"])
        else
          Champion.create(champ_id: key, name: champ["name"], champ_key: champ["key"])
        end
      end
    end
  end
end
