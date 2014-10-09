class CreateCategoryPublics < ActiveRecord::Migration
  def change
    create_table :category_publics do |t|
      t.string :nom

      t.timestamps
    end
  end
end
