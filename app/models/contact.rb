# -*- encoding : utf-8 -*-
class Contact < ActiveRecord::Base
	attr_accessible :nom, :tel, :mail, :selected, :role, :fax, :tel2

  scope :to_display, :conditions => ['selected = ?', true], :order => 'nom asc'  
end
