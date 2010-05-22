class Manifestation < ActiveRecord::Base
  # validations
  validates_presence_of :nom, :lieu, :date_debut, :mission_id, :on => :create, :message => "doit être renseigné."
  
  # relations
  has_many :photos, :dependent => :destroy
  belongs_to :mission
  has_attached_file :illustration, :style => { :thumb => "150x150>" }
  
  accepts_nested_attributes_for :photos, :allow_destroy => true
  
  default_scope :order => "date_debut desc"
  
  named_scope :to_come, :conditions => ['date_debut >= ? AND validate = ?', Time.now, true]
  named_scope :past, :conditions => ['date_debut <= ? AND validate = ?', Time.now, true]
  named_scope :pending, :conditions => ['validate = ?', false]
    
  
end
