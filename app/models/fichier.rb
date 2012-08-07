# -*- encoding : utf-8 -*-
class Fichier < ActiveRecord::Base
	attr_accessible :manifestation_id, :offre_id, :fichier

  belongs_to :manifestation
  belongs_to :offre
  has_attached_file :fichier,
    :path => "public/system/:attachment/:id/:style/:filename",
    :url => "public/system/:attachment/:id/:style/:filename"
end
