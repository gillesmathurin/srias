class AddLogoLinkColumnToPartenaires < ActiveRecord::Migration
  def self.up
    add_column :partenaires, :logo_link, :string
  end

  def self.down
    remove_column :partenaires, :logo_link
  end
end
