class NewsletterWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(newsletter_id)
    newsletter = Newsletter.find(newsletter_id)
    abonnes = Abonne.all.collect(&:email)
    abonnes.each do |abonne|
      NewsletterMailer.newsletter(abonne, newsletter).deliver
    end
    newsletter.update_attribute(:delivered_at, Time.now)
  end
end