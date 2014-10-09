class CategoryPublic < ActiveRecord::Base
  attr_accessible :nom
  has_and_belongs_to_many :manifestations
  has_and_belongs_to_many :prestataires
end
