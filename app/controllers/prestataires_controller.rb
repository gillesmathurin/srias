class PrestatairesController < ApplicationController
  # GET /prestataires
  # GET /prestataires.json
  def index
    @prestataires = Prestataire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prestataires }
    end
  end

  # GET /prestataires/1
  # GET /prestataires/1.json
  def show
    @prestataire = Prestataire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prestataire }
    end
  end

  # GET /prestataires/new
  # GET /prestataires/new.json
  def new
    @prestataire = Prestataire.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prestataire }
    end
  end

  # GET /prestataires/1/edit
  def edit
    @prestataire = Prestataire.find(params[:id])
  end

  # POST /prestataires
  # POST /prestataires.json
  def create
    @prestataire = Prestataire.new(params[:prestataire])

    respond_to do |format|
      if @prestataire.save
        format.html { redirect_to @prestataire, notice: 'Prestataire enregistré.' }
        format.json { render json: @prestataire, status: :created, location: @prestataire }
      else
        format.html { render action: "new" }
        format.json { render json: @prestataire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prestataires/1
  # PUT /prestataires/1.json
  def update
    @prestataire = Prestataire.find(params[:id])

    respond_to do |format|
      if @prestataire.update_attributes(params[:prestataire])
        format.html { redirect_to @prestataire, notice: 'Prestataire modifié avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prestataire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestataires/1
  # DELETE /prestataires/1.json
  def destroy
    @prestataire = Prestataire.find(params[:id])
    @prestataire.destroy

    respond_to do |format|
      format.html { redirect_to prestataires_url }
      format.json { head :no_content }
    end
  end
end
