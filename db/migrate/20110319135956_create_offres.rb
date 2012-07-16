# -*- encoding : utf-8 -*-
class CreateOffres < ActiveRecord::Migration
  def self.up
    create_table :offres do |t|
      t.string :nom
      t.integer :partenaire_id
      t.date :date_debut
      t.date :date_fin
      t.text :description
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :offres
  end
end
