class Fichier < ActiveRecord::Base
  belongs_to :manifestation
  belongs_to :offre
  has_attached_file :fichier
end
