# -*- encoding : utf-8 -*-
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def annonces_courantes
    @annonces_courantes ||= Annonce.courantes(nil)
  end
  
  def missing_annonce_image(annonce)
    annonce.image.url(:thumb) == "/images/thumb/missing.png"
  end
  
  def missing_action_illustration(manifestation)
    manifestation.illustration.url == "/illustrations/original/missing.png"      
  end
  
  def display_link_or_image(fichier)
    if fichier && fichier.fichier.present?
      if fichier.fichier.content_type =~ /image/
        image_tag(fichier.fichier.url(nil,false), :width => "585")
      else
        link_to("Téléchargez #{fichier.fichier.original_filename}", fichier.fichier.url(nil, false), :class => "button small medium")
      end
    end
  end  
end
