require "spec_helper"

describe InformationController do
  describe "routing" do

    it "routes to #index" do
      get("/information").should route_to("information#index")
    end

    it "routes to #new" do
      get("/information/new").should route_to("information#new")
    end

    it "routes to #show" do
      get("/information/1").should route_to("information#show", :id => "1")
    end

    it "routes to #edit" do
      get("/information/1/edit").should route_to("information#edit", :id => "1")
    end

    it "routes to #create" do
      post("/information").should route_to("information#create")
    end

    it "routes to #update" do
      put("/information/1").should route_to("information#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/information/1").should route_to("information#destroy", :id => "1")
    end

  end
end
