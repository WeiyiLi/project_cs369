class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :series_id
      t.integer :season
      t.integer :number
      t.string :name

      t.timestamps
    end
    add_index :episodes, [:series_id, :season, :number]
  end
end
