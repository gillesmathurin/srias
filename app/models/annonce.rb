class Annonce < ActiveRecord::Base
  has_attached_file :image , :styles => { :thumb => "250x250>", :medium => "600x600>" }
  
  validates_attachment_content_type :image, :content_type => [ 'image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
  validates_attachment_size :image, :less_than => 2.megabytes
  
  def self.courantes(hide_time)
    with_scope :find => { :conditions => "starts_at <= now() AND ends_at >= now()" } do
      if hide_time.nil?
        find(:all)
      else
        find(:all, :conditions => ["updated_at < ? OR starts_at > ?", hide_time, hide_time])
      end
    end
  end
end
