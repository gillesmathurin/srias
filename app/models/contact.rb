# -*- encoding : utf-8 -*-
class Contact < ActiveRecord::Base
  scope :to_display, :conditions => ['selected = ?', true], :order => 'nom asc'  
end
