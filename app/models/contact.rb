class Contact < ActiveRecord::Base
  named_scope :to_display, :conditions => ['selected = ?', true], :order => 'nom asc'  
end
