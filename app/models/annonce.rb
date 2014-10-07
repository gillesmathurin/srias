# -*- encoding : utf-8 -*-
class Annonce < ActiveRecord::Base
  attr_accessible :image, :message, :starts_at, :ends_at

  has_attached_file :image , :styles => { :thumb => "250x250>", :medium => "600x600>" },
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  validates :message, presence: true
  
  def self.courantes(hide_time)
    with_scope :find => where("ends_at >= now()") do
      hide_time.nil? ? all : where("updated_at > ? OR starts_at > ?", hide_time, hide_time).all
    end
  end
end