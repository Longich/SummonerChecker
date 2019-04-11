class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :item
      t.string :rune
      t.string :mastery
      t.string :summoner
      t.string :champion
      t.string :profileicon
      t.string :map
      t.string :language
      t.string :sticker

      t.timestamps
    end
  end
end
