# -*- encoding : utf-8 -*-
class AddCategoryColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :category, :string
  end

  def self.down
    remove_column :users, :category
  end
end
