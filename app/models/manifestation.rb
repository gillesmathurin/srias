# -*- encoding : utf-8 -*-
class Manifestation < ActiveRecord::Base
  include Assets::Normalizer

  attr_accessible :nom, :lieu, :date_debut, :date_fin, :description, :mission_id, :validate, :as_annonce, :illustration, :prestataire_ids
  # Validations
  validates :nom, :lieu, :date_debut, :date_fin, :mission_id,
   :presence => { :on => :create, :message => "doit être renseigné." }
  
  # Relations
  has_many :photos, :dependent => :destroy
  has_many :fichiers, :dependent => :destroy
  belongs_to :mission
  has_and_belongs_to_many :prestataires

  # Attachement
  has_attached_file :illustration, :styles => { :thumb => "150x150>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

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
  
  def self.group_by_year()
    self.past.group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}
  end

  def self.to_come_group_by_year()
    self.to_come.group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}
  end

  def self.pending_group_by_year()
    self.pending.group_by {|e| e.date_debut.year}.sort {|a,b| b<=>a}
  end
  
end
