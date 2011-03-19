class Offre < ActiveRecord::Base
  belongs_to :partenaire
  has_attached_file :document
end
