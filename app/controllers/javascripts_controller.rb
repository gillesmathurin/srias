class JavascriptsController < ApplicationController
  def masquer_annonce
    session[:announcement_hide_time] = Time.now
  end
end
