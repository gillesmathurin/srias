class AddFicheColumnsToManifestations < ActiveRecord::Migration
  def self.up
    add_column :manifestations, :fiche_file_name, :string
    add_column :manifestations, :fiche_file_size, :integer
    add_column :manifestations, :fiche_content_type, :string
    add_column :manifestations, :fiche_updated_at, :datetime
  end

  def self.down
    remove_column :manifestations, :fiche_updated_at
    remove_column :manifestations, :fiche_content_type
    remove_column :manifestations, :fiche_file_size
    remove_column :manifestations, :fiche_file_name
  end
end
