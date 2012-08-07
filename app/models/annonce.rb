# -*- encoding : utf-8 -*-
class Annonce < ActiveRecord::Base
  attr_accessible :image

  has_attached_file :image , :styles => { :thumb => "250x250>", :medium => "600x600>" },
  	:path => "/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
  
  # validates_attachment_content_type :image, :content_type => [ 'image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
  # validates_attachment_size :image, :less_than => 2.megabytes
  
  def self.courantes(hide_time)
    with_scope :find => where("starts_at <= now() AND ends_at >= now()") do
      hide_time.nil? ? all : where("updated_at > ? OR starts_at > ?", hide_time, hide_time).all
    end
  end
end