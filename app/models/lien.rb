# -*- encoding : utf-8 -*-
class Lien < ActiveRecord::Base
	attr_accessible :nom, :adresse
	validates :nom, :adresse, :presence => { :on => :create, :message => "Doit être renseigné." }
end
