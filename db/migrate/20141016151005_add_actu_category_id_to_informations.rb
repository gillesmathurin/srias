class AddActuCategoryIdToInformations < ActiveRecord::Migration
  def change
    add_column :informations, :actu_category_id, :integer
  end
end
