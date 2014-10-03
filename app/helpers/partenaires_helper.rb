# -*- encoding : utf-8 -*-
module PartenairesHelper
  def image_present?(partenaire)
    partenaire.logo.url(:thumb) != "/logos/thumb/missing.png"
  end

  def offre_debut(offre)
    if offre.date_debut
      return "Du " +  l(offre.date_debut, format: :default)
    end
  end

  def offre_fin(offre)
    if offre.date_fin
      return "Au " + l(offre.date_fin , format: :default)
    end
  end
end
