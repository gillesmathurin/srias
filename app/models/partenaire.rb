class Partenaire < ActiveRecord::Base
  belongs_to :category
  has_attached_file :logo, :styles => {:thumb => "150x150>"}
end
