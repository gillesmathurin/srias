class LiensController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  # GET /liens
  # GET /liens.xml
  def index
    @liens = Lien.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @liens }
    end
  end

  # GET /liens/1
  # GET /liens/1.xml
  def show
    @lien = Lien.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lien }
    end
  end

  # GET /liens/new
  # GET /liens/new.xml
  def new
    @lien = Lien.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lien }
    end
  end

  # GET /liens/1/edit
  def edit
    @lien = Lien.find(params[:id])
  end

  # POST /liens
  # POST /liens.xml
  def create
    @lien = Lien.new(params[:lien])

    respond_to do |format|
      if @lien.save
        flash[:notice] = 'Lien was successfully created.'
        format.html { redirect_to(@lien) }
        format.xml  { render :xml => @lien, :status => :created, :location => @lien }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lien.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /liens/1
  # PUT /liens/1.xml
  def update
    @lien = Lien.find(params[:id])

    respond_to do |format|
      if @lien.update_attributes(params[:lien])
        flash[:notice] = 'Lien was successfully updated.'
        format.html { redirect_to(@lien) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lien.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /liens/1
  # DELETE /liens/1.xml
  def destroy
    @lien = Lien.find(params[:id])
    @lien.destroy

    respond_to do |format|
      format.html { redirect_to(liens_url) }
      format.xml  { head :ok }
    end
  end
end
