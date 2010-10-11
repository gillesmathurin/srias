class Newsletter < ActiveRecord::Base
  has_attached_file :file
  # validates_attachment_content_type :file, :content_type => "application/pdf", :message => " type de fichier incorrect"
  
  
  # Deliver newsletter to subscriber
  def deliver
    #find all the abonnes emails
    @abonnes = Abonne.all.collect(&:email)
    # Sends the newsletter to each one
    @abonnes.each do |abonne|
      NewsletterMailer.deliver_newsletter(abonne, self)
    end
    # Set the delivered_at time to now
    self.update_attribute(:delivered_at, Time.now)
  end
end
