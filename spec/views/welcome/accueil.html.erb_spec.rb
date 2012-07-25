# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/welcome/accueil" do
	let(:annonces_courantes) { [mock_model("Annonce")] }

	before(:each) do
	  controller.stub(:annonces_courantes).and_return(annonces_courantes)
	end

  #Delete this example and add some real ones or delete this file
  it "displays the texte titre" do
  	pending()
  	assign(:texte, double("Texte", :titre => "un titre"))
  	render
    rendered.should contain("un titre")
  end

  it "displays the texte content" do
  	pending()
    assign(:texte, double("Texte", :content => "un contenu"))
    render
    rendered.should contain("un contenu")
  end
end
