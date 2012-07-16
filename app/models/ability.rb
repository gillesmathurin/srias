# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    alias_action :validate => :modify
    
    if user.role?(:admin)
      can :manage, :all
      can :modify, Manifestation      
    else
      can :read, :all
      if user.role?(:redacteur)
        can :read, Manifestation
        can :create, Manifestation
        can :update, Manifestation
      end
    end
  end  
  
end
