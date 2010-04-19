class NewsletterMailer < ActionMailer::Base  

  def newsletter(abonne, newsletter)
    subject    'NewsletterMailer#newsletter'
    recipients abonne
    from       ''
    sent_on    Time.now
    
    body       :newsletter => newsletter
  end

end
