# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :partenaires
  validates_presence_of :nom, :on => :create, :message => "Vous devez renseigner un nom"
end
