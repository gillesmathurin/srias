class Mission < ActiveRecord::Base
  validates_presence_of :nom, :description, :on => :create, :message => "doit être renseigné."
end
