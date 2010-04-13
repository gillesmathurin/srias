class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :titre
      t.text :sommaire
      t.text :content
      t.binary :preview

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
