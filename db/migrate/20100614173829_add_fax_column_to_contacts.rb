# -*- encoding : utf-8 -*-
class AddFaxColumnToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :fax, :string
  end

  def self.down
    remove_column :contacts, :fax
  end
end
