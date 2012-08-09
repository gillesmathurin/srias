class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :nom
      t.string :prenom
      t.string :telephone
      t.string :administration
      t.string :portable
      t.string :email
      t.text :demande

      t.timestamps
    end
  end
end
