# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/fichiers/new" do
	let(:manifestation) { mock_model("Manifestation") }
	let(:offre) { mock_model("Offre") }

	context "a manifestation's fichier" do
		before(:each) do
    	assign(:manifestation, manifestation)
    	assign(:fichier, mock_model("Fichier",
    		:manifestation_id => manifestation.id))
  	end
	  
	  it "renders the new fichier form" do
	    render
	    rendered.should have_selector("form", :method => "post",
	     :action => manifestation_fichiers_path(manifestation, @fichier)) do |form|
	    	form.should have_selector("input", :type => "file", :name => "manifestation_fichier[fichier]")
	    end	    
	  end
	end

	context "an offre's fichier" do
	  before(:each) do
	    assign(:offre, offre)
	    assign(:fichier, mock_model("Fichier", :offre_id => offre.id))
	  end

	  it "renders the new fichier form" do
	    render
	    rendered.should have_selector("form", :method => "post",
	     :action => manifestation_fichiers_path(offre, @fichier)) do |form|
	    	form.should have_selector("input", :type => "file", :name => "manifestation_fichier[fichier]")
	    end	
	  end
	end

end
