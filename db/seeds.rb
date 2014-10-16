# -*- encoding : utf-8 -*-
# Creation des 2 premiers administrateurs
# User.delete_all
# if User.count == 0
#   User.create(:login => "gillesmath", :email => "gillesmath@me.com", :password => "30carmen30", :password_confirmation => "30carmen30", :role => "admin")
# # TODO : creer le second administrateur à la fin de conception du site
#   User.create(:login => "admin", :email => "srias971@orange.fr", :password => "con4nex", :password_confirmation => "con4nex", :role => "admin")
# end
# 
# # Creation des missions :
# tableau = ["Mission Jeunesse", "Mission Senior", "Mission Famille", "Mission Formation et Prévention"]
# Mission.delete_all
# if Mission.count == 0
#   tableau.each do |e|
#     Mission.create(:nom => e)
#   end
# end

# Creation des tuples de Category
categories = ["Hotelier", "Culture", "Transport", "Centre de Loisirs"]
categories.each do |category|
  Category.create!(:nom => category) unless Category.where(nom: category).any?
end

public_categories = %w(Agent Enfant Agent-famille Retraite)
public_categories.each do |category|
  CategoryPublic.create!(nom: category) unless CategoryPublic.where(nom: category).any?
end

# Categories d'actualites
actu_categories = ["Logement temporaire", "Logement d'urgence", "Aide aux nouveaux arrivants"]
actu_categories.each do |cat|
  ActuCategory.create!(nom: cat) unless ActuCategory.where(nom: cat).any?
end
