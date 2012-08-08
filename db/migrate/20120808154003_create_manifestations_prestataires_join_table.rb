class CreateManifestationsPrestatairesJoinTable < ActiveRecord::Migration
  def up
  	create_table :manifestations_prestataires, :id => false do |t|
  		t.integer :manifestation_id
  		t.integer :prestataire_id
  	end
  end

  def down
  	drop_table :manifestations_prestataires
  end
end
