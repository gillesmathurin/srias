class Photo < ActiveRecord::Base
  belongs_to :manifestation

  has_attached_file :photo, :styles => {:thumb => "150x150>", :large => "600x600>" }  
  process_in_background :photo
end
