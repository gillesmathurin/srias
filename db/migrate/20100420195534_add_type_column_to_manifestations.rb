# -*- encoding : utf-8 -*-
class AddTypeColumnToManifestations < ActiveRecord::Migration
  def self.up
    add_column :manifestations, :type, :string
  end

  def self.down
    remove_column :manifestations, :type
  end
end
