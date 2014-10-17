module FichePratiquesHelper
  def display_link_or_image_of(fiche)
    if fiche && fiche.fichier.present?
      if fiche.fichier.content_type =~/image/
        image_tag(fiche.fichier.url(nil, false), width: "100")
      else
        link_to("Téléchargez #{fiche.fichier.original_filename}", fiche.fichier.url(nil, false))
      end
    end
  end
end
