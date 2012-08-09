# -*- encoding : utf-8 -*-
class Partenaire < ActiveRecord::Base
  belongs_to :category
  has_many :offres, :dependent =>:destroy

  attr_accessible :link, :nom, :description, :logo_link, :category_id
  
  accepts_nested_attributes_for :offres, :allow_destroy => true
  
  has_attached_file :logo, :styles => {:thumb => "150x150>"},
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  # Validations
  validates :link, :url => true, :allow_blank => true
end
