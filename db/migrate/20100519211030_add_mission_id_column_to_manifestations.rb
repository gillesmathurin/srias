class AddMissionIdColumnToManifestations < ActiveRecord::Migration
  def self.up
    add_column :manifestations, :mission_id, :integer
  end

  def self.down
    remove_column :manifestations, :mission_id
  end
end
