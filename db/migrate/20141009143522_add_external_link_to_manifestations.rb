class AddExternalLinkToManifestations < ActiveRecord::Migration
  def change
    add_column :manifestations, :external_link, :string
  end
end
