class Mission < ActiveRecord::Base
  validates_presence_of :nom, :on => :create, :message => "doit être renseigné."
end
