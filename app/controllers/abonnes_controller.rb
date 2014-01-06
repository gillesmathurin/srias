# -*- encoding : utf-8 -*-
class AbonnesController < ApplicationController
  respond_to :html, :xml, :js

  # GET /abonnes
  # GET /abonnes.xml
  def index
    @abonnes = Abonne.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @abonnes }
    end
  end

  # GET /abonnes/1
  # GET /abonnes/1.xml
  def show
    @abonne = Abonne.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @abonne }
    end
  end

  # GET /abonnes/new
  # GET /abonnes/new.xml
  def new
    @abonne = Abonne.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @abonne }
    end
  end

  # GET /abonnes/1/edit
  def edit
    @abonne = Abonne.find(params[:id])
  end

  # POST /abonnes
  # POST /abonnes.xml
  def create
    @abonne = Abonne.new(params[:abonne])

    respond_to do |format|
      if @abonne.save
        flash[:notice] = 'Abonne was successfully created.'
        format.html { redirect_to(@abonne) }
        format.xml  { render :xml => @abonne, :status => :created, :location => @abonne }
        format.js { }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @abonne.errors, :status => :unprocessable_entity }
        format.js { }
      end
    end
  end

  # PUT /abonnes/1
  # PUT /abonnes/1.xml
  def update
    @abonne = Abonne.find(params[:id])

    respond_to do |format|
      if @abonne.update_attributes(params[:abonne])
        flash[:notice] = 'Abonne was successfully updated.'
        format.html { redirect_to(@abonne) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @abonne.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /abonnes/1
  # DELETE /abonnes/1.xml
  def destroy
    @abonne = Abonne.find(params[:id])
    @abonne.destroy

    respond_to do |format|
      format.html { redirect_to(abonnes_url) }
      format.xml  { head :ok }
    end
  end
  
  def delete_all
    Abonne.delete_all
    respond_to do |format|
      format.html { redirect_to(abonnes_url) }
      format.xml { head :ok }
    end
  end
end
