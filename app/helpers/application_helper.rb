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
end
