class User < ActiveRecord::Base
  acts_as_authentic
  
  ROLES = %w{ admin redacteur moderateur}
  
  def role?(role)
    self.role == role.to_s
  end
  
end
