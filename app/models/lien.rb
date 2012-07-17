# -*- encoding : utf-8 -*-
class Lien < ActiveRecord::Base
	validates :nom, :adresse, :presence => { :on => :create, :message => "Doit être renseigné." }
end
