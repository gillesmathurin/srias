# -*- encoding : utf-8 -*-
class AddTitreColumnToTexteAccueils < ActiveRecord::Migration
  def self.up
    add_column :texte_accueils, :titre, :string
  end

  def self.down
    remove_column :texte_accueils, :titre
  end
end
