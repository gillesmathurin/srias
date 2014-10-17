class CreateFichePratiques < ActiveRecord::Migration
  def change
    create_table :fiche_pratiques do |t|
      t.string :title
      t.text :content
      t.string :external_link

      t.timestamps
    end
  end
end
