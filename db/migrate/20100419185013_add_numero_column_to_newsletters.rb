# -*- encoding : utf-8 -*-
class AddNumeroColumnToNewsletters < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :numero, :string
  end

  def self.down
    remove_column :newsletters, :numero
  end
end
