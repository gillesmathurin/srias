# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :partenaires
  validates :nom, :presence => {:on => :create, :message => "Vous devez renseigner un nom"}
end
