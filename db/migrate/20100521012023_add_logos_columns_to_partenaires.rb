class AddLogosColumnsToPartenaires < ActiveRecord::Migration
  def self.up
    add_column :partenaires, :logo_file_name, :string
    add_column :partenaires, :logo_content_type, :string
    add_column :partenaires, :logo_file_size, :integer
    add_column :partenaires, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :partenaires, :logo_updated_at
    remove_column :partenaires, :logo_file_size
    remove_column :partenaires, :logo_content_type
    remove_column :partenaires, :logo_file_name
  end
end
