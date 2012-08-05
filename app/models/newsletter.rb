# -*- encoding : utf-8 -*-
class Newsletter < ActiveRecord::Base
  attr_accessible :titre, :content, :sommaire, :numero, :preview

  has_attached_file :file,
    :path => "/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"  
  # validates_attachment_content_type :file, :content_type => "application/pdf", :message => " type de fichier incorrect"
  
  # Deliver newsletter to subscriber
  def deliver
    #find all the abonnes emails
    @abonnes = Abonne.all.collect(&:email)
    # Sends the newsletter to each one
    @abonnes.each do |abonne|
      NewsletterMailer.newsletter(abonne, self).deliver
    end
    # Set the delivered_at time to now
    self.update_attribute(:delivered_at, Time.now)
  end
  
  def deliver_test
    @abonnes = %w(gillesmath@me.com guillou.g3@wanadoo.fr)
    @abonnes.each do |abonne|
      NewsletterMailer.newsletter(abonne, self).deliver
    end
    self.update_attribute(:delivered_at, Time.now)
  end
end
