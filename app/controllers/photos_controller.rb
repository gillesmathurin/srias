# -*- encoding : utf-8 -*-
class PhotosController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :find_manifestation
  
  def new
    @photo = @manifestation.photos.build
  end
  
  def create
    @photo = @manifestation.photos.build(params[:photo])
    
    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo enregistrée avec succès.'
        format.html { redirect_to(@manifestation) }
        format.xml { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |wants|
      wants.html { redirect_to manifestation_path(@manifestation) }
    end
  end
  
  private
  
  def find_manifestation
    @manifestation = Manifestation.find(params[:manifestation_id]) if params[:manifestation_id]
  end
end
