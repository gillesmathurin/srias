# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ManifestationsHelper do

	describe "manif_or_action_show_link(manifestation, actions_link)" do
	  let(:manifestation) { FactoryGirl.create(:manifestation) }

	  context "with the actions_link param sets to true" do
	    it "displays an action link" do
	      helper.manif_or_action_show_link(manifestation, true).should eql(link_to("Voir", uneaction_path(manifestation.id)))
	    end
	  end

	  context "with the actions_link param sets to false" do
	  	it "displays a manifestation link" do
	  	  helper.manif_or_action_show_link(manifestation, false).should eql(link_to("Voir", manifestation_path(manifestation))) 
	  	end	    
	  end

	end

	describe "manif_or_action_index_link(manifestation)" do
	  context "with a future manifestation" do
	  	before(:each) do
	  	  
	  	end

	    it "displays a link to the actions index page given a future manif" do
	    	@future_manif = FactoryGirl.create(:future_manif)
	      helper.manif_or_action_index_link(@future_manif).should eql(link_to("Retour", actions_path))
	    end

	    it "displays a link to the manifestations index page given a past manifestation" do
	      @past_manif = FactoryGirl.create(:past_manif)
	      helper.manif_or_action_index_link(@past_manif).should eql(link_to("Retour", manifestations_path))       
	    end
	  end
	end

end
