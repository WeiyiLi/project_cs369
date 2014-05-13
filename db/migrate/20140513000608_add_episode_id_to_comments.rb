class AddEpisodeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :episode_id, :integer
    add_index :comments, [:episode_id,:created_at]
  end
end