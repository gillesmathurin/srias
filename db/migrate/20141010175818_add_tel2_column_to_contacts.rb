class AddTel2ColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :tel2, :string
  end
end
