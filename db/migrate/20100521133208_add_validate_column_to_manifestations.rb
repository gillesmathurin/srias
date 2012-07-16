# -*- encoding : utf-8 -*-
class AddValidateColumnToManifestations < ActiveRecord::Migration
  def self.up
    add_column :manifestations, :validate, :boolean, :default => false
  end

  def self.down
    remove_column :manifestations, :validate
  end
end
