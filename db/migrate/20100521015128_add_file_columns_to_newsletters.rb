# -*- encoding : utf-8 -*-
class AddFileColumnsToNewsletters < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :file_file_name, :string
    add_column :newsletters, :file_content_type, :string
    add_column :newsletters, :file_file_size, :integer
    add_column :newsletters, :file_updated_at, :datetime
  end

  def self.down
    remove_column :newsletters, :file_updated_at
    remove_column :newsletters, :file_file_size
    remove_column :newsletters, :file_content_type
    remove_column :newsletters, :file_file_name
  end
end
