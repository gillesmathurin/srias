class WelcomeController < ApplicationController
  def accueil
    @actions = Manifestation.to_come(:limit => 5)
    @texte = TexteAccueil.last
  end
end
