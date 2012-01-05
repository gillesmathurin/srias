class Mission < ActiveRecord::Base
  validates_presence_of :nom, :on => :create, :message => "doit être renseigné."
  has_many :manifestations
  
  def to_param
    "#{id}-" + nom.parameterize
  end
end
