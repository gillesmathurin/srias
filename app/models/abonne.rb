class Abonne < ActiveRecord::Base
  validates_uniqueness_of :email, :on => :create, :message => "Cette adresse est déjà enregistrée!"
  validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, :on => :create, :message => "is invalid"
end
