# -*- encoding : utf-8 -*-
class AddLinkColumnToPartenaires < ActiveRecord::Migration
  def self.up
    add_column :partenaires, :link, :string
  end

  def self.down
    remove_column :partenaires, :link
  end
end
