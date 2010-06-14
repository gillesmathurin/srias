class Fichier < ActiveRecord::Base
  belongs_to :manifestation
  has_attached_file :fichier
end
