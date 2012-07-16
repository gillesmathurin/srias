# -*- encoding : utf-8 -*-
require 'spec_helper'

describe MissionsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/missions" }.should route_to(:controller => "missions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/missions/new" }.should route_to(:controller => "missions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/missions/1" }.should route_to(:controller => "missions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/missions/1/edit" }.should route_to(:controller => "missions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/missions" }.should route_to(:controller => "missions", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/missions/1" }.should route_to(:controller => "missions", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/missions/1" }.should route_to(:controller => "missions", :action => "destroy", :id => "1") 
    end
  end
end
