require 'spec_helper'

describe AbonnesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/abonnes" }.should route_to(:controller => "abonnes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/abonnes/new" }.should route_to(:controller => "abonnes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/abonnes/1" }.should route_to(:controller => "abonnes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/abonnes/1/edit" }.should route_to(:controller => "abonnes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/abonnes" }.should route_to(:controller => "abonnes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/abonnes/1" }.should route_to(:controller => "abonnes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/abonnes/1" }.should route_to(:controller => "abonnes", :action => "destroy", :id => "1") 
    end
  end
end
