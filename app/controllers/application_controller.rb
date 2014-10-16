# -*- encoding : utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'cancan'

class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  
  helper_method :forem_user

  helper :all # include all helpers, all the time
  protect_from_forgery  with: :exception # See ActionController::RequestForgeryProtection for details
  helper_method :current_user_session, :current_user
  
  before_filter :create_abonne, :update_visitor_counter, :latest_actualites
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
  def update_visitor_counter
    Visitor.find_or_create_by_ip(request.ip)
    @visitors_count = Visitor.count
  end

  def latest_actualites
    @actualites ||= Information.published.latest(3)
  end
  
  protected
  
  def create_abonne
    @abonne = Abonne.new
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "Vous devez être identifié pour accéder à cette page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "Vous devez être déconnecté pour accéder à cette page"
      redirect_to account_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
