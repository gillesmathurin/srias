# -*- encoding : utf-8 -*-
class TexteAccueilsController < ApplicationController
  
  before_filter :require_user
  
  # GET /texte_accueils
  # GET /texte_accueils.xml
  def index
    @texte_accueils = TexteAccueil.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @texte_accueils }
    end
  end

  # GET /texte_accueils/1
  # GET /texte_accueils/1.xml
  def show
    @texte_accueil = TexteAccueil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @texte_accueil }
    end
  end

  # GET /texte_accueils/new
  # GET /texte_accueils/new.xml
  def new
    @texte_accueil = TexteAccueil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @texte_accueil }
    end
  end

  # GET /texte_accueils/1/edit
  def edit
    @texte_accueil = TexteAccueil.find(params[:id])
  end

  # POST /texte_accueils
  # POST /texte_accueils.xml
  def create
    @texte_accueil = TexteAccueil.new(params[:texte_accueil])

    respond_to do |format|
      if @texte_accueil.save
        flash[:notice] = 'TexteAccueil was successfully created.'
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => @texte_accueil, :status => :created, :location => @texte_accueil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @texte_accueil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /texte_accueils/1
  # PUT /texte_accueils/1.xml
  def update
    @texte_accueil = TexteAccueil.find(params[:id])

    respond_to do |format|
      if @texte_accueil.update_attributes(params[:texte_accueil])
        flash[:notice] = 'TexteAccueil was successfully updated.'
        format.html { redirect_to(root_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @texte_accueil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /texte_accueils/1
  # DELETE /texte_accueils/1.xml
  def destroy
    @texte_accueil = TexteAccueil.find(params[:id])
    @texte_accueil.destroy

    respond_to do |format|
      format.html { redirect_to(texte_accueils_url) }
      format.xml  { head :ok }
    end
  end
end
