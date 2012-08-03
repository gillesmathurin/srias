# -*- encoding : utf-8 -*-
class Fichier < ActiveRecord::Base
  belongs_to :manifestation
  belongs_to :offre
  has_attached_file :fichier,
    :path => "/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
end
