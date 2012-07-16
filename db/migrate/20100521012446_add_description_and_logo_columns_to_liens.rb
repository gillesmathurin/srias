# -*- encoding : utf-8 -*-
class AddDescriptionAndLogoColumnsToLiens < ActiveRecord::Migration
  def self.up
    add_column :liens, :description, :text
    add_column :liens, :logo_file_size, :integer
    add_column :liens, :logo_file_name, :string
    add_column :liens, :logo_file_content_type, :string
    add_column :liens, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :liens, :logo_updated_at
    remove_column :liens, :logo_file_content_type
    remove_column :liens, :logo_file_name
    remove_column :liens, :logo_file_size
    remove_column :liens, :description
  end
end
