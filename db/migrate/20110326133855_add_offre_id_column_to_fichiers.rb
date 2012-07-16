# -*- encoding : utf-8 -*-
class AddOffreIdColumnToFichiers < ActiveRecord::Migration
  def self.up
    add_column :fichiers, :offre_id, :integer
  end

  def self.down
    remove_column :fichiers, :offre_id
  end
end
