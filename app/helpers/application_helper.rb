# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime("%d/%m/%Y")
  end
  
  def annonces_courantes
    @annonces_courantes ||= Annonce.courantes(session[:announcement_hide_time])
  end
  
  def missing_annonce_image(annonce)
    annonce.image.url == "/images/thumb/missing.png"
  end
  
  def missing_action_illustration(manifestation)
    manifestation.illustration.url == "/illustrations/thumb/missing.png"
  end
  
  def display_link_or_image(fichier)
    if fichier.fichier.url != "/fichiers/missing.png"
      if fichier.fichier.content_type =~ /image/
        image_tag(fichier.fichier.url(nil, false), :width => "585")
      else
        link_to("Téléchargez : #{fichier.fichier.original_filename}", fichier.fichier.url(nil, false))
      end
    end
  end
end
