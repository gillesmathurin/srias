class WelcomeController < ApplicationController
  def accueil
    @actions = Manifestation.to_come(:limit => 5)
    @texte = TexteAccueil.last
    Visitor.find_or_create_by_ip(request.ip)
    @visitors_count = Visitor.count
  end
end
