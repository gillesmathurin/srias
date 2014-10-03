class RenameInformationTable < ActiveRecord::Migration
  def up
    rename_table :information, :informations
  end

  def down
    rename_table :informations, :information
  end
end
