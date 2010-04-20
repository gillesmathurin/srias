# Creation des 2 premiers administrateurs
if User.count == 0
  User.create(:login => "gillesmath", :email => "gillesmath@me.com", :password => "30carmen30", :password_confirmation => "30carmen30", :category => "admin")
# TODO : creer le second administrateur à la fin de conception du site
end

# Creation des missions :
tableau = ["L’accès aux logements", "La restauration collective et individuelle", "Les actions en faveur des enfants", "Les actions en faveur des retraités", "Les actions tendant à faciliter l’accès aux pratiques  et manifestations sociales (culture, sports, loisirs)", "Les actions d’information, de formations et de sensibilisation"]
tableau.each do |e|
  Mission.create(:nom => e)
end