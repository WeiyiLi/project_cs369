class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name

      t.timestamps
    end

    add_index :series, :name, unique: true
  end
end
