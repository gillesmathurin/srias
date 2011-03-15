class CreateAnnonces < ActiveRecord::Migration
  def self.up
    create_table :annonces do |t|
      t.text :message
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :image_file_name
      t.string :image_content_type
      t.datetime :image_updated_at
      t.integer :image_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :annonces
  end
end
