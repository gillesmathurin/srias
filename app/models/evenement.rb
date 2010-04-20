class Evenement < Manifestation
  has_attached_file :illustration, :style => { :thumb => "150x150>" }
  
  process_in_background :illustration
end
