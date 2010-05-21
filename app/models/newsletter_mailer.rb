class NewsletterMailer < ActionMailer::Base

  def newsletter(abonne, newsletter)
    subject         "Newsletter du Srias de Guadeloupe #{newsletter.id}"
    recipients      abonne
    from            ''
    sent_on         Time.now    
    body            :newsletter => newsletter
    content_type    "text/html"
    
    attachment "application/pdf" do |a|
      a.body = File.read("public/#{newsletter.file.url(nil, false)}")
    end
  end

end
