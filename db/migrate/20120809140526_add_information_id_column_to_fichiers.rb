class AddInformationIdColumnToFichiers < ActiveRecord::Migration
  def change
    add_column :fichiers, :information_id, :integer
  end
end
