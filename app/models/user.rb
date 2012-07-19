# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :login, :email, :password, :password_confirmation, :password_salt, :persistence_token
  
  ROLES = %w{ admin redacteur moderateur}
  
  def role?(role)
    self.role == role.to_s
  end  
end
