class Information < ActiveRecord::Base
  attr_accessible :content, :title, :information_file, :actu_category_id
  belongs_to :actu_category
  # Attachment
  has_attached_file :information_file,
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  	:url => "/system/:attachment/:id/:style/:filename"

  has_many :fichiers, :dependent => :destroy

  scope :published, where(published: true)
  scope :latest, ->(count) { limit(count).order('created_at desc') }

  def self.grouped_by_category
    all.group_by(&:actu_category_id)
  end
end
