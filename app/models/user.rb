# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :login, :email, :password, :password_confirmation, :password_salt, :persistence_token, :forem_admin, :role
  
  ROLES = %w{ admin redacteur moderateur basic}
  
  def role?(role)
    self.role == role.to_s
  end  

  def can_create_forem_topics(forum)
  	user.role == "admin" || user.role == "basic"
  end
end
