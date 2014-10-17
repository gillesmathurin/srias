class FichePratiquesController < ApplicationController
  # GET /fiche_pratiques
  # GET /fiche_pratiques.json
  def index
    @fiche_pratiques = FichePratique.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fiche_pratiques }
    end
  end

  # GET /fiche_pratiques/1
  # GET /fiche_pratiques/1.json
  def show
    @fiche_pratique = FichePratique.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fiche_pratique }
    end
  end

  # GET /fiche_pratiques/new
  # GET /fiche_pratiques/new.json
  def new
    @fiche_pratique = FichePratique.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fiche_pratique }
    end
  end

  # GET /fiche_pratiques/1/edit
  def edit
    @fiche_pratique = FichePratique.find(params[:id])
  end

  # POST /fiche_pratiques
  # POST /fiche_pratiques.json
  def create
    @fiche_pratique = FichePratique.new(params[:fiche_pratique])

    respond_to do |format|
      if @fiche_pratique.save
        format.html { redirect_to @fiche_pratique, notice: 'Fiche pratique was successfully created.' }
        format.json { render json: @fiche_pratique, status: :created, location: @fiche_pratique }
      else
        format.html { render action: "new" }
        format.json { render json: @fiche_pratique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fiche_pratiques/1
  # PUT /fiche_pratiques/1.json
  def update
    @fiche_pratique = FichePratique.find(params[:id])

    respond_to do |format|
      if @fiche_pratique.update_attributes(params[:fiche_pratique])
        format.html { redirect_to @fiche_pratique, notice: 'Fiche pratique was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fiche_pratique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiche_pratiques/1
  # DELETE /fiche_pratiques/1.json
  def destroy
    @fiche_pratique = FichePratique.find(params[:id])
    @fiche_pratique.destroy

    respond_to do |format|
      format.html { redirect_to fiche_pratiques_url }
      format.json { head :no_content }
    end
  end
end
