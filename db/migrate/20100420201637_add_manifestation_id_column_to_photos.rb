class AddManifestationIdColumnToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :manifestation_id, :integer
  end

  def self.down
    remove_column :photos, :manifestation_id
  end
end
