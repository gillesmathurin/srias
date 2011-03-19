class Partenaire < ActiveRecord::Base
  belongs_to :category
  has_many :offres, :dependent =>:destroy
  
  accepts_nested_attributes_for :offres, :allow_destroy => true
  
  has_attached_file :logo, :styles => {:thumb => "150x150>"}
end
