class Partenaire < ActiveRecord::Base
  has_attached_file :logo, :styles => {:thumb => "150x150>"}
end
