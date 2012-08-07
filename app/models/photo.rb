# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :manifestation

  attr_accessible :manifestation_id, :photo

  has_attached_file :photo, :styles => {:thumb => "150x150>", :large => "600x600>" },
    :path => "public/system/:attachment/:id/:style/:filename",
    :url => "public/system/:attachment/:id/:style/:filename"  
end
