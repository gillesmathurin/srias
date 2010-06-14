class FichiersController < ApplicationController
  before_filter :find_manifestation
  
  def index
    @fichiers = @manifestation.fichiers
  end

  def show
    @fichier = @manifestation.fichiers.find(params[:id])
  end

  def new
    @fichier = @manifestation.fichiers.build()
  end

  def edit
    @fichier = @manifestation.fichiers.find(params[:id])
  end
  
  def create
    @fichier = @manifestation.fichiers.build(params[:fichier])
    
    respond_to do |format|
      if @fichier.save
        flash[:notice] = 'Fichier enregistré avec succès.'
        format.html { redirect_to(@manifestation) }
        format.xml { render :xml => @fichier, :status => :created, :location => @fichier }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @fichier.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @fichier = @manifestation.fichiers.find(params[:id])
    
    respond_to do |format|
      if @fichier.update_attributes(params[:fichier])
        flash[:notice] = "Fichier modifié avec succès."
        format.html { redirect_to(@manifestation) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @fichier = @manifestation.fichiers.find(params[:id])
    @fichier.destroy
    
    respond_to do |format|
      format.html { redirect_to(@manifestation) }
    end
  end
  
  private
  
  def find_manifestation
    @manifestation = Manifestation.find(params[:manifestation_id]) if params[:manifestation_id]
  end
end
