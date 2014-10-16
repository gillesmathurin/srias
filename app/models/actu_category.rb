class ActuCategory < ActiveRecord::Base
  attr_accessible :nom
  has_many :informations
end
