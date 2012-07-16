# -*- encoding : utf-8 -*-
class Offre < ActiveRecord::Base
  belongs_to :partenaire
  has_many :fichiers, :dependent => :destroy
  accepts_nested_attributes_for :fichiers, :allow_destroy => true
end
