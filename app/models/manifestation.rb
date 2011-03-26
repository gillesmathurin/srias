class Manifestation < ActiveRecord::Base
  # validations
  validates_presence_of :nom, :lieu, :date_debut, :mission_id, :on => :create, :message => "doit être renseigné."
  
  # relations
  has_many :photos, :dependent => :destroy
  has_many :fichiers, :dependent => :destroy
  belongs_to :mission
  has_attached_file :illustration, :style => { :thumb => "150x150>" }
  
  accepts_nested_attributes_for :photos, :allow_destroy => true
  
  default_scope :order => "date_debut desc"
  
  named_scope :to_come, :conditions => ['date_debut >= ? AND validate = ?', Time.now, true]
  named_scope :past, :conditions => ['date_debut <= ? AND validate = ?', Time.now, true]
  named_scope :pending, :conditions => ['validate = ?', false]
  
  def self.group_by_year(params_page)
    self.past.group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}.paginate(:page => params_page, :per_page => 10)
  end
    
  
end
