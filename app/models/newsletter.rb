# -*- encoding : utf-8 -*-
class Newsletter < ActiveRecord::Base
  attr_accessible :titre, :content, :sommaire, :numero, :preview, :file

  has_attached_file :file,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"  
  
  # Deliver newsletter to subscriber
  def deliver
    @abonnes = Abonne.all.collect(&:email)
    @abonnes.each do |abonne|
      logger.info("Sending newsletter to #{abonne}")
      NewsletterMailer.delay.newsletter(abonne, self)
    end
    self.update_attribute(:delivered_at, Time.now)
  end
  
  def deliver_test
    @abonnes = %w(gillesmath@me.com guillou.g3@wanadoo.fr)
    @abonnes.each do |abonne|
      logger.info("Sending newsletter to #{abonne}")
      NewsletterMailer.delay.newsletter(abonne, self)
    end
    self.update_attribute(:delivered_at, Time.now)
  end
end
