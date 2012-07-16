# -*- encoding : utf-8 -*-
class CreateManifestations < ActiveRecord::Migration
  def self.up
    create_table :manifestations do |t|
      t.string :nom
      t.string :lieu
      t.datetime :date_debut
      t.datetime :date_fin
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :manifestations
  end
end
