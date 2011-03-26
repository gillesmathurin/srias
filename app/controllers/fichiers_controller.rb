class FichiersController < ApplicationController
  before_filter :find_manifestation, :find_offre
  
  def index
    @fichiers = @manifestation.fichiers if @manifestation
    @fichiers = @offre.fichiers if @offre
  end

  def show
    if @manifestation
      @fichier = @manifestation.fichiers.find(params[:id])
    elsif @offre
      @fichier = @offre.fichiers.find(params[:id])
    end
  end

  def new
    if @manifestation      
      @fichier = @manifestation.fichiers.build()
    elsif @offre
      @fichier = @offre.fichiers.build()
    end
  end

  def edit
    if @manifestation
      @fichier = @manifestation.fichiers.find(params[:id])
    elsif @offre
      @fichier = @offre.fichiers.find(params[:id])
    end
  end
  
  def create
    if @manifestation
      @fichier = @manifestation.fichiers.build(params[:fichier])
    elsif @offre
      @fichier = @offre.fichiers.build(params[:fichier])
    end
    
    respond_to do |format|
      if @fichier.save
        flash[:notice] = 'Fichier enregistré avec succès.'
        format.html { redirect_to(@manifestation) } if @manifestation
        format.html { redirect_to(@offre) } if @offre
        format.xml { render :xml => @fichier, :status => :created, :location => @fichier }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @fichier.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    if @manifestation
      @fichier = @manifestation.fichiers.find(params[:id])
    elsif @offre
      @fichier = @offre.fichiers.find(params[:id])
    end
    
    respond_to do |format|
      if @fichier.update_attributes(params[:fichier])
        flash[:notice] = "Fichier modifié avec succès."
        format.html { redirect_to(@manifestation) } if @manifestation
        format.html { redirect_to(@offre) } if @offre
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    if @manifestation
      @fichier = @manifestation.fichiers.find(params[:id])
    elsif @offre
      @fichier = @offre.fichiers.find(params[:id])
    end
    
    @fichier.destroy
    
    respond_to do |format|
      format.html { redirect_to(@manifestation) } if @manifestation
      format.html { redirect_to(@offre) } if @offre
    end
  end
  
  private
  
  def find_manifestation
    @manifestation = Manifestation.find(params[:manifestation_id]) if params[:manifestation_id]
  end
  
  def find_offre
    @offre = Offre.find(params[:offre_id]) if params[:offre_id]
  end
end
