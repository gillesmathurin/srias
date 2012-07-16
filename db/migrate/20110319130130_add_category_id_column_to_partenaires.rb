# -*- encoding : utf-8 -*-
class AddCategoryIdColumnToPartenaires < ActiveRecord::Migration
  def self.up
    add_column :partenaires, :category_id, :integer
  end

  def self.down
    remove_column :partenaires, :category_id
  end
end
