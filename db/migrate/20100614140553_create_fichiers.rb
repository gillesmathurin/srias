class CreateFichiers < ActiveRecord::Migration
  def self.up
    create_table :fichiers do |t|
      t.string :fichier_file_name
      t.string :fichier_content_type
      t.datetime :fichier_updated_at
      t.integer :fichier_file_size
      t.integer :manifestation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fichiers
  end
end
