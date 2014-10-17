class AddAttachmentFichierToFichePratiques < ActiveRecord::Migration
  def self.up
    change_table :fiche_pratiques do |t|
      t.attachment :fichier
    end
  end

  def self.down
    drop_attached_file :fiche_pratiques, :fichier
  end
end
