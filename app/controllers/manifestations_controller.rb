class ManifestationsController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :find_mission
  # GET /manifestations
  # GET /manifestations.xml
  def index
    @manifestations = Manifestation.past.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @manifestations }
    end
  end
  
  def actions
    if @mission
      @manifestations = @mission.manifestations.to_come.paginate(:page => params[:page], :per_page => 10)
    else
      @manifestations = Manifestation.to_come.paginate(:page => params[:page], :per_page => 10)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @manifestations }
    end
  end
  
  def pending
    @manifestations = Manifestation.pending.paginate(:page => params[:page], :per_page => 10)
    render :partial => "manifs_list",:layout => false
  end

  # GET /manifestations/1
  # GET /manifestations/1.xml
  def show
    @manifestation = Manifestation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @manifestation }
    end
  end

  # GET /manifestations/new
  # GET /manifestations/new.xml
  def new
    @manifestation = Manifestation.new
    6.times { @manifestation.photos.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @manifestation }
    end
  end

  # GET /manifestations/1/edit
  def edit
    @manifestation = Manifestation.find(params[:id])
  end

  # POST /manifestations
  # POST /manifestations.xml
  def create
    @manifestation = Manifestation.new(params[:manifestation])

    respond_to do |format|
      if @manifestation.save
        flash[:notice] = 'Manifestation enregistrée avec succès.'
        format.html { redirect_to(@manifestation) }
        format.xml  { render :xml => @manifestation, :status => :created, :location => @manifestation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @manifestation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /manifestations/1
  # PUT /manifestations/1.xml
  def update
    @manifestation = Manifestation.find(params[:id])

    respond_to do |format|
      if @manifestation.update_attributes(params[:manifestation])
        flash[:notice] = 'Manifestation modifiée avec succès.'
        format.html { redirect_to(@manifestation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @manifestation.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def validate
    @manifestation = Manifestation.find(params[:id])
    @manifestation.update_attribute(:validate, true)
    unauthorized! if cannot? :modify, @manifestation
    
    respond_to do |format|
      format.html { redirect_to(actions_manifestations_url) }    
    end
  end
  
  def unvalidate
    @manifestation = Manifestation.find(params[:id])
    @manifestation.update_attribute(:validate, false)
    unauthorized! if cannot? :modify, @manifestation
    
    respond_to do |format|
      format.html { redirect_to(actions_manifestations_url) }    
    end
  end

  # DELETE /manifestations/1
  # DELETE /manifestations/1.xml
  def destroy
    @manifestation = Manifestation.find(params[:id])
    @manifestation.destroy

    respond_to do |format|
      format.html { redirect_to(manifestations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_mission
    @mission = Mission.find(params[:mission_id]) if params[:mission_id]
  end
end
