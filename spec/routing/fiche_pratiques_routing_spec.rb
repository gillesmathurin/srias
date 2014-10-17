require "spec_helper"

describe FichePratiquesController do
  describe "routing" do

    it "routes to #index" do
      get("/fiche_pratiques").should route_to("fiche_pratiques#index")
    end

    it "routes to #new" do
      get("/fiche_pratiques/new").should route_to("fiche_pratiques#new")
    end

    it "routes to #show" do
      get("/fiche_pratiques/1").should route_to("fiche_pratiques#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fiche_pratiques/1/edit").should route_to("fiche_pratiques#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fiche_pratiques").should route_to("fiche_pratiques#create")
    end

    it "routes to #update" do
      put("/fiche_pratiques/1").should route_to("fiche_pratiques#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fiche_pratiques/1").should route_to("fiche_pratiques#destroy", :id => "1")
    end

  end
end
