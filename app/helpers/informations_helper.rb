# -*- encoding : utf-8 -*-
module InformationsHelper
  def display_link_or_image_of(information)
    if information && information.information_file.present?
      if information.information_file.content_type =~ /image/
        image_tag(information.information_file.url(nil,false), :width => "100")
      else
        link_to("Téléchargez #{information.information_file.original_filename}", information.information_file.url(nil, false), :class => "button small medium")
      end
    end
  end 
end
