# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :manifestation

  attr_accessible :manifestation_id, :photo_file_name, :photo_file_size, :photo_content_type,
   :photo_updated_at

  has_attached_file :photo, :styles => {:thumb => "150x150>", :large => "600x600>" },
    :path => "/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"  
end
