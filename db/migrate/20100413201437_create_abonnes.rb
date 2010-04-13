class CreateAbonnes < ActiveRecord::Migration
  def self.up
    create_table :abonnes do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :abonnes
  end
end
