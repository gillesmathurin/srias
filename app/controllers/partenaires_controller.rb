# -*- encoding : utf-8 -*-
class PartenairesController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update]
  # GET /partenaires
  # GET /partenaires.xml
  def index
    @partenaires = Partenaire.all.group_by(&:category_id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partenaires }
    end
  end

  # GET /partenaires/1
  # GET /partenaires/1.xml
  def show
    @partenaire = Partenaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partenaire }
    end
  end

  # GET /partenaires/new
  # GET /partenaires/new.xml
  def new
    @partenaire = Partenaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partenaire }
    end
  end

  # GET /partenaires/1/edit
  def edit
    @partenaire = Partenaire.find(params[:id])
  end

  # POST /partenaires
  # POST /partenaires.xml
  def create
    @partenaire = Partenaire.new(params[:partenaire])

    respond_to do |format|
      if @partenaire.save
        flash[:notice] = 'Partenaire was successfully created.'
        format.html { redirect_to(@partenaire) }
        format.xml  { render :xml => @partenaire, :status => :created, :location => @partenaire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partenaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partenaires/1
  # PUT /partenaires/1.xml
  def update
    @partenaire = Partenaire.find(params[:id])

    respond_to do |format|
      if @partenaire.update_attributes(params[:partenaire])
        flash[:notice] = 'Partenaire was successfully updated.'
        format.html { redirect_to(@partenaire) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partenaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partenaires/1
  # DELETE /partenaires/1.xml
  def destroy
    @partenaire = Partenaire.find(params[:id])
    @partenaire.destroy

    respond_to do |format|
      format.html { redirect_to(partenaires_url) }
      format.xml  { head :ok }
    end
  end
end
