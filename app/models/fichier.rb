# -*- encoding : utf-8 -*-
class Fichier < ActiveRecord::Base
	attr_accessible :manifestation_id, :offre_id, :fichier, :information_id

  	belongs_to :manifestation
  	belongs_to :offre
  	belongs_to :fichier, :class_name => "Fichier", :foreign_key => "fichier_id"
  	
  	has_attached_file :fichier,
    	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    	:url => "/system/:attachment/:id/:style/:filename"
end
