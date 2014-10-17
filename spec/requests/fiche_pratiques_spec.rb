require 'spec_helper'

describe "FichePratiques" do
  describe "GET /fiche_pratiques" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get fiche_pratiques_path
      response.status.should be(200)
    end
  end
end
