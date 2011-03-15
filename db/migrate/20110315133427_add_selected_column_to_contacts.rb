class AddSelectedColumnToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :selected, :boolean, :default => false
  end

  def self.down
    remove_column :contacts, :selected
  end
end
