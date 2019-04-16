class Version < ApplicationRecord

  def check_latest_champ_version_and_update(static_client)
    current_version = get_current_version
    latest_version = fetch_latest_version static_client
    if (current_version.nil?)
      Version.create(item: latest_version["item"], rune: latest_version["rune"],
        mastery: latest_version["mastery"], summoner: latest_version["summoner"], champion: latest_version["champion"],
        profileicon: latest_version["profileicon"], map: latest_version["map"], 
        language: latest_version["language"], sticker: latest_version["language"])
    elsif (current_version[:champion] == latest_version["champion"])
      return
    end
    current_version.update(item: latest_version["item"], rune: latest_version["rune"],
      mastery: latest_version["mastery"], summoner: latest_version["summoner"], champion: latest_version["champion"],
      profileicon: latest_version["profileicon"], map: latest_version["map"], 
      language: latest_version["language"], sticker: latest_version["language"])
  end

  private
  def get_current_version
    Version.last
  end

  def fetch_latest_version(static_client)
    static_client.fetch_latest_version["n"]
  end
end
