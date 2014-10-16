class CreateActuCategories < ActiveRecord::Migration
  def change
    create_table :actu_categories do |t|
      t.string :nom

      t.timestamps
    end
  end
end
