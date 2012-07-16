# -*- encoding : utf-8 -*-
class AddAsAnnonceFieldToManifestations < ActiveRecord::Migration
  def self.up
    add_column :manifestations, :as_annonce, :boolean, :default => false
  end

  def self.down
    remove_column :manifestations, :as_annonce
  end
end
