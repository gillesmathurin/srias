# -*- encoding : utf-8 -*-
module MissionsHelper
  def lieu(action)
    if !action.lieu.blank? || !action.lieu.nil?
      @content = " Lieu : " + "#{action.lieu}"
    else
      @content = ""
    end
  end
end
