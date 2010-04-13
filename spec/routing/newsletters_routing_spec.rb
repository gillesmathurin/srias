require 'spec_helper'

describe NewslettersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/newsletters" }.should route_to(:controller => "newsletters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/newsletters/new" }.should route_to(:controller => "newsletters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/newsletters/1" }.should route_to(:controller => "newsletters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/newsletters/1/edit" }.should route_to(:controller => "newsletters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/newsletters" }.should route_to(:controller => "newsletters", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/newsletters/1" }.should route_to(:controller => "newsletters", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/newsletters/1" }.should route_to(:controller => "newsletters", :action => "destroy", :id => "1") 
    end
  end
end
