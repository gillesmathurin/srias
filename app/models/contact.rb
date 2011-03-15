class Contact < ActiveRecord::Base
  named_scope :to_display, :conditions => ['selected = ?', true], :order => 'name asc'  
end
