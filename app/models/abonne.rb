# -*- encoding : utf-8 -*-
class Abonne < ActiveRecord::Base
  attr_accessible :email

  validates :email,
    :uniqueness => { :message => "Cette adresse est déjà enregistrée!", :on => :create },
    :format => { 
              :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i,
  						:message => "n'est pas valide",
  						:on => :create 
    }
end
