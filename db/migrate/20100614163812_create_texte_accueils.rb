class CreateTexteAccueils < ActiveRecord::Migration
  def self.up
    create_table :texte_accueils do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :texte_accueils
  end
end
