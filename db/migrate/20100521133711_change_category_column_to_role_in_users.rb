# -*- encoding : utf-8 -*-
class ChangeCategoryColumnToRoleInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :category, :role
  end

  def self.down
    rename_column :users, :role, :category
  end
end
