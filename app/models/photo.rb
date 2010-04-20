class Photo < ActiveRecord::Base
  has_attached_file :photo
  belongs_to :manifestation
end
