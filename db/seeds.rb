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
  Category.create!(:nom => category)
end
