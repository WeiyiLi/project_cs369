class CreateWatchlists < ActiveRecord::Migration
  def change
    create_table :watchlists do |t|
      t.integer :follower_id
      t.integer :series_id

      t.timestamps
    end
    add_index :watchlists, :follower_id
    add_index :watchlists, :series_id
    add_index :watchlists, [:follower_id, :series_id], unique: true
  end
end
