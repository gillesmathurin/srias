require 'spec_helper'

describe EvenementsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/evenements" }.should route_to(:controller => "evenements", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/evenements/new" }.should route_to(:controller => "evenements", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/evenements/1" }.should route_to(:controller => "evenements", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/evenements/1/edit" }.should route_to(:controller => "evenements", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/evenements" }.should route_to(:controller => "evenements", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/evenements/1" }.should route_to(:controller => "evenements", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/evenements/1" }.should route_to(:controller => "evenements", :action => "destroy", :id => "1") 
    end
  end
end
