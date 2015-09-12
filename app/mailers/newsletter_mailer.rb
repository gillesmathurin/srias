# -*- encoding : utf-8 -*-
class NewsletterMailer < ActionMailer::Base
  default :from => "srias.guadeloupe@gmail.com"

  def newsletter(abonne, newsletter)
    @newsletter = newsletter
    mail(:to => abonne,
         :subject => "Newsletter du Srias de Guadeloupe",
         :charset => "UTF-8",
         :content_type => "text/html",
         :from => "srias.guadeloupe@gmail.com")
    # if newsletter.file.url != "/files/original/missing.png" && File.exists?(newsletter.file.path)
    #   attachments[newsletter.file.original_filename] = File.read("/var/rails/srias2/current/public#{newsletter.file.url(nil,false)}")
    # end
  end

  def contact_message(message)
    @message = message
    mail( :to => "srias.guadeloupe@gmail.com",
          :subject => "Demande d'informations provenant du site",
          :charset => "UTF-8",
          :content_type => "text/html")
  end

end