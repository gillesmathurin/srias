# -*- encoding : utf-8 -*-
class Manifestation < ActiveRecord::Base
  include Assets::Normalizer

  attr_accessible :nom, :lieu, :date_debut, :date_fin, :description, :mission_id
  # Validations
  validates :nom, :lieu, :date_debut, :date_fin, :mission_id,
   :presence => { :on => :create, :message => "doit être renseigné." }
  
  # Relations
  has_many :photos, :dependent => :destroy
  has_many :fichiers, :dependent => :destroy
  belongs_to :mission
  has_attached_file :illustration, :styles => { :thumb => "150x150>" }
  
  accepts_nested_attributes_for :photos, :allow_destroy => true
  
  # Scope
  default_scope :order => "date_debut desc"  
  scope :to_come, where('date_debut >= ? OR date_fin >= ? AND validate = ?',Time.now, Time.now, true).order('date_debut asc')
  scope :past, where('date_fin <= ? AND validate = ?', Time.now, true)
  scope :pending, where(:validate => false)
  scope :as_valid_annonces, where('as_annonce IS TRUE')
    
  def to_param
    "#{id}-" + nom.parameterize
  end
  
  def self.group_by_year(params_page)
    self.past.paginate(:page => params_page, :per_page => 10).group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}
  end

  def self.to_come_group_by_year(params_page)
    self.to_come.paginate(:page => params_page, :per_page => 10).group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}
  end

  def self.pending_group_by_year(params_page)
    self.pending.paginate(:page => params_page, :per_page => 10).group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}
  end
  
end
