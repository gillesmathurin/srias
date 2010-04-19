class NewsletterMailer < ActionMailer::Base  

  def newsletter(abonne, newsletter)
    subject    "Newsletter du Srias de Guadeloupe #{newsletter.id}"
    recipients abonne
    from       ''
    sent_on    Time.now
    
    body       :newsletter => newsletter
  end

end
