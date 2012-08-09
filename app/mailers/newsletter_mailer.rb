# -*- encoding : utf-8 -*-
class NewsletterMailer < ActionMailer::Base
  default :from => "srias.guadeloupe@orange.fr"

  def newsletter(abonne, newsletter)
    @newsletter = newsletter
    mail(:to => abonne,
         :subject => "Newsletter du Srias de Guadeloupe",
         :charset => "UTF-8",
         :content_type => "text/html",
         :from => "srias.guadeloupe@orange.fr")
    if newsletter.file.url != "/files/original/missing.png" && File.exists?(newsletter.file.path)
      attachments[newsletter.file.file_name] = File.read("#{RAILS.root}/public#{newsletter.file.url(nil,false)}")
    end
  end

  def contact_message(message)
    @message = message
    mail( :to => "srias.guadeloupe@orange.fr",
          :subject => "Demande d'informations provenant du site",
          :charset => "UTF-8",
          :content_type => "text/html")
  end

end