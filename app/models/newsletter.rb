class Newsletter < ActiveRecord::Base
  
  # Deliver newsletter to subscriber
  def deliver
    #find all the abonnes emails
    @abonnes = Abonne.all(:select => "email")
    # Sends the newsletter to each one
    @abonnes.each do |abonne|
      NewsletterMailer.deliver_newsletter(abonne, self)
    end
    # Set the delivered_at time to now
    self.update_attribute(:delivered_at, Time.now)
  end
end
