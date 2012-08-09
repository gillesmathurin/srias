class Information < ActiveRecord::Base
  attr_accessible :content, :title, :information_file
  # Attachment
  has_attached_file :information_file,
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  	:url => "/system/:attachment/:id/:style/:filename"

  has_many :fichiers, :dependent => :destroy
end
