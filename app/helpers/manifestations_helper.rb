module ManifestationsHelper
  def fiche_presente?(partenaire)
    partenaire.fiche.url() != "/logos/thumb/missing.png"
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
