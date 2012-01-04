class NewsletterMailer < ActionMailer::Base

  def newsletter(abonne, newsletter)
    subject         "Newsletter du Srias de Guadeloupe"
    recipients      abonne
    from            "srias.guadeloupe@orange.fr"
    sent_on         Time.now    
    body            :newsletter => newsletter
    content_type    "text/html"
    charset         "UTF-8"
    
    if newsletter.file.url != "/files/original/missing.png" && File.exists?(newsletter.file.path)
      attachment newsletter.file.content_type do |a|
        a.body = File.read("#{RAILS_ROOT}/public#{newsletter.file.url(nil, false)}")
      end
    end
  end

end
