class Message < ActiveRecord::Base
  attr_accessible :administration, :demande, :email, :nom, :portable, :prenom, :telephone
end
