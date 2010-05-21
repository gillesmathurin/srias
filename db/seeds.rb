# Creation des 2 premiers administrateurs
if User.count == 1 && User.first.login == "gillesmath"
  User.create(:login => "gillesmath", :email => "gillesmath@me.com", :password => "30carmen30", :password_confirmation => "30carmen30", :role => "admin")
# TODO : creer le second administrateur à la fin de conception du site
  User.create(:login => "admin", :email => "srias971@orange.fr", :password => "con4nex", :password_confirmation => "con4nex", :role => "admin")
end

# Creation des missions :
tableau = ["L’accès aux logements", "La restauration collective et individuelle", "Les actions en faveur des enfants", "Les actions en faveur des retraités", "Les actions tendant à faciliter l’accès aux pratiques  et manifestations sociales (culture, sports, loisirs)", "Les actions d’information, de formations et de sensibilisation"]
if Mission.count == 0
  tableau.each do |e|
    Mission.create(:nom => e)
  end
end
