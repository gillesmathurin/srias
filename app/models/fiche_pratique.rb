class FichePratique < ActiveRecord::Base
  attr_accessible :content, :external_link, :title, :fichier

  has_attached_file :fichier, :styles => { :thumb => "250x250>", :medium => "600x600>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
end
