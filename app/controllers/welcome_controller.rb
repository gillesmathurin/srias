class WelcomeController < ApplicationController
  def accueil
    @actions = Manifestation.to_come(:limit => 5)
    @action_as_annonces = Manifestation.as_valid_annonces.to_come
    @texte = TexteAccueil.last
    Visitor.find_or_create_by_ip(request.ip)
    @visitors_count = Visitor.count
  end
end
