class AddPublishedColumnToInformations < ActiveRecord::Migration
  def change
    add_column :informations, :published, :boolean, default: true
  end
end
