# -*- encoding : utf-8 -*-
class Newsletter < ActiveRecord::Base
  attr_accessible :titre, :content, :sommaire, :numero, :preview, :file

  has_attached_file :file,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"  
  
  # Deliver newsletter to subscriber
  def deliver
    #find all the abonnes emails
    @abonnes = Abonne.all.collect(&:email)
    @abonnes.each do |abonne|
      # NewsletterMailer.newsletter(abonne, self).deliver
      NewsletterMailer.delay.newsletter(abonne, self)
    end
    # Set the delivered_at time to now
    self.update_attribute(:delivered_at, Time.now)
  end
  
  def deliver_test
    @abonnes = %w(gillesmath@me.com guillou.g3@wanadoo.fr)
    @abonnes.each do |abonne|
      # NewsletterMailer.newsletter(abonne, self).deliver
      NewsletterMailer.deliver.newsletter(abonne, self)
    end
    self.update_attribute(:delivered_at, Time.now)
  end
end
