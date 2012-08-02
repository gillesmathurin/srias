# -*- encoding : utf-8 -*-
module ManifestationsHelper
  
  def manif_or_action_show_link(manifestation, actions_link)
    actions_link ? (link_to "Voir", uneaction_path(manifestation.id), :class => "button small") :
     (link_to "Voir", manifestation_path(manifestation), :class => "button small")
  end
  
  def manif_or_action_index_link(manifestation)
    manifestation.date_debut > Time.now ? link_to("Retour", actions_path, :class => "button small") :
     link_to("Retour", manifestations_path, :class => "button small")
  end

  def nom_mission(mission_id)
  	Mission.find(mission_id).nom
  end
  
end
