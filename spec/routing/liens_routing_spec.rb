# -*- encoding : utf-8 -*-
require 'spec_helper'

describe LiensController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/liens" }.should route_to(:controller => "liens", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/liens/new" }.should route_to(:controller => "liens", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/liens/1" }.should route_to(:controller => "liens", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/liens/1/edit" }.should route_to(:controller => "liens", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/liens" }.should route_to(:controller => "liens", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/liens/1" }.should route_to(:controller => "liens", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/liens/1" }.should route_to(:controller => "liens", :action => "destroy", :id => "1") 
    end
  end
end
