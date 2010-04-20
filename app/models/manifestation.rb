class Manifestation < ActiveRecord::Base
  validates_presence_of :nom, :lieu, :date_debut, :on => :create, :message => "doit être renseigné."
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  
  default_scope :order => "date_debut desc"
end
