class Lien < ActiveRecord::Base
  validates_presence_of :nom, :adresse, :on => :create, :message => "Doit être renseigné."
end
