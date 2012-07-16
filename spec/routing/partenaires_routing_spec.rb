# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PartenairesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/partenaires" }.should route_to(:controller => "partenaires", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/partenaires/new" }.should route_to(:controller => "partenaires", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/partenaires/1" }.should route_to(:controller => "partenaires", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/partenaires/1/edit" }.should route_to(:controller => "partenaires", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/partenaires" }.should route_to(:controller => "partenaires", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/partenaires/1" }.should route_to(:controller => "partenaires", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/partenaires/1" }.should route_to(:controller => "partenaires", :action => "destroy", :id => "1") 
    end
  end
end
