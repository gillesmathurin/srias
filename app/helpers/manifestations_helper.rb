# -*- encoding : utf-8 -*-
module ManifestationsHelper
  def fiche_presente?(partenaire)
    partenaire.fiche.url() != "/logos/thumb/missing.png"
  end
  
  def manif_or_action_show_link(manifestation, actions_link)
    if actions_link
      link_to "Voir", uneaction_path(manifestation.id)
    else
      link_to "Voir", manifestation_path(manifestation)
    end
  end
  
  def manif_or_action_index_link(manifestation)
    if manifestation.date_debut > Time.now
      link_to "Retour", actions_path
    else
      link_to "Retour", manifestations_path
    end
  end
  
end
