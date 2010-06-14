class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :nom
      t.string :tel
      t.string :mail

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
