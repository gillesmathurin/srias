class CreateLiens < ActiveRecord::Migration
  def self.up
    create_table :liens do |t|
      t.string :nom
      t.string :adresse

      t.timestamps
    end
  end

  def self.down
    drop_table :liens
  end
end
