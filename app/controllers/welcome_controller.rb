class WelcomeController < ApplicationController
  def accueil
    @actions = Manifestation.to_come(:limit => 5)
  end

end
