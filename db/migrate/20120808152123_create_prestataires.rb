class CreatePrestataires < ActiveRecord::Migration
  def change
    create_table :prestataires do |t|
      t.string :nom
      t.string :website
      t.string :tel
      t.string :mob
      t.string :fax
      t.text :description

      t.timestamps
    end
  end
end
