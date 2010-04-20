class AddIllustrationColumnsToManifestation < ActiveRecord::Migration
  def self.up
    add_column :manifestations, :illustration_content_type, :string
    add_column :manifestations, :illustration_file_size, :integer
    add_column :manifestations, :illustration_file_name, :string
    add_column :manifestations, :illustration_updated_at, :datetime
  end

  def self.down
    remove_column :manifestations, :illustration_updated_at
    remove_column :manifestations, :illustration_file_name
    remove_column :manifestations, :illustration_file_size
    remove_column :manifestations, :illustration_content_type
  end
end
