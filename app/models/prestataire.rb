class Prestataire < ActiveRecord::Base
  attr_accessible :description, :fax, :mob, :nom, :tel, :website, :manifestation_ids, :logopic
  has_and_belongs_to_many :manifestations
  # Attachment
  has_attached_file :logopic, :styles => { :thumb => "250x250>", :medium => "600x600>" },
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
end
