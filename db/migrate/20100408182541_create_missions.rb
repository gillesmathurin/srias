class CreateMissions < ActiveRecord::Migration
  def self.up
    create_table :missions do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :missions
  end
end
