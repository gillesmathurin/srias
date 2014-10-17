# -*- encoding : utf-8 -*-
class InformationsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update]
  # GET /information
  # GET /information.json
  def index
    # @informations = Information.paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @informations = Information.published.grouped_by_category

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @information }
    end
  end

  # GET /information/1
  # GET /information/1.json
  def show
    @information = Information.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @information }
    end
  end

  # GET /information/new
  # GET /information/new.json
  def new
    @information = Information.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @information }
    end
  end

  # GET /information/1/edit
  def edit
    @information = Information.find(params[:id])
  end

  # POST /information
  # POST /information.json
  def create
    @information = Information.new(params[:information])

    respond_to do |format|
      if @information.save
        format.html { redirect_to @information, notice: 'Information enregistrée.' }
        format.json { render json: @information, status: :created, location: @information }
      else
        format.html { render action: "new" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /information/1
  # PUT /information/1.json
  def update
    @information = Information.find(params[:id])

    respond_to do |format|
      if @information.update_attributes(params[:information])
        format.html { redirect_to @information, notice: 'Information modifiée avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information = Information.find(params[:id])
    @information.destroy

    respond_to do |format|
      format.html { redirect_to informations_url }
      format.json { head :no_content }
    end
  end

  def publish
    @information = Information.find(params[:id])
    @information.published ? @information.update_attribute(:published, false) : @information.update_attribute(:published, true)

    respond_to do |format|
      format.html { redirect_to information_url(@information) }
    end
  end

  def sidebar_status
    @information = Information.find(params[:id])
    @information.in_right_sidebar ? @information.update_attribute(:in_right_sidebar, false) : @information.update_attribute(:in_right_sidebar, true)

    respond_to do |format|
      format.html { redirect_to information_url(@information) }
    end
  end
end
