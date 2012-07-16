# -*- encoding : utf-8 -*-
class CreatePartenaires < ActiveRecord::Migration
  def self.up
    create_table :partenaires do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :partenaires
  end
end
