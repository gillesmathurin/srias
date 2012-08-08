class Prestataire < ActiveRecord::Base
  attr_accessible :description, :fax, :mob, :nom, :tel, :website
  has_and_belongs_to_many :manifestations
end
