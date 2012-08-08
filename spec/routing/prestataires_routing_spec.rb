require "spec_helper"

describe PrestatairesController do
  describe "routing" do

    it "routes to #index" do
      get("/prestataires").should route_to("prestataires#index")
    end

    it "routes to #new" do
      get("/prestataires/new").should route_to("prestataires#new")
    end

    it "routes to #show" do
      get("/prestataires/1").should route_to("prestataires#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prestataires/1/edit").should route_to("prestataires#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prestataires").should route_to("prestataires#create")
    end

    it "routes to #update" do
      put("/prestataires/1").should route_to("prestataires#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prestataires/1").should route_to("prestataires#destroy", :id => "1")
    end

  end
end
