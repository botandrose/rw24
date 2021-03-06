class AddRaceIdToPoints < ActiveRecord::Migration[4.2]
  def self.up
    add_column :points, :race_id, :integer
    add_index :points, :race_id
  end

  def self.down
    remove_index :points, :race_id
    remove_column :points, :race_id
  end
end
