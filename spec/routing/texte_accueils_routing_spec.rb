# -*- encoding : utf-8 -*-
require 'spec_helper'

describe TexteAccueilsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/texte_accueils" }.should route_to(:controller => "texte_accueils", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/texte_accueils/new" }.should route_to(:controller => "texte_accueils", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/texte_accueils/1" }.should route_to(:controller => "texte_accueils", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/texte_accueils/1/edit" }.should route_to(:controller => "texte_accueils", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/texte_accueils" }.should route_to(:controller => "texte_accueils", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/texte_accueils/1" }.should route_to(:controller => "texte_accueils", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/texte_accueils/1" }.should route_to(:controller => "texte_accueils", :action => "destroy", :id => "1") 
    end
  end
end
