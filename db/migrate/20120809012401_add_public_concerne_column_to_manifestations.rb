class AddPublicConcerneColumnToManifestations < ActiveRecord::Migration
  def change
    add_column :manifestations, :public_concerne, :string
  end
end
