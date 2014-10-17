class AddInRightSidebarColumnToInformations < ActiveRecord::Migration
  def change
    add_column :informations, :in_right_sidebar, :boolean, default: false
  end
end
