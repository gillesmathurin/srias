# -*- encoding : utf-8 -*-
class NewsletterMailer < ActionMailer::Base

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

end
