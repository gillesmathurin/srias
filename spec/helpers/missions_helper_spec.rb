# -*- encoding : utf-8 -*-
require 'spec_helper'

describe MissionsHelper do

	describe "lieu(action)" do
	  it "returns a blank string as lieu if the action lieu is blank or nil" do
	  	pending("waiting to see wether the lieu is the required manifestation's attribute")
	    @manif_lieu_blank = FactoryGirl.create(:manifestation, :lieu => "")
	    @manif_lieu_nil = FactoryGirl.create(:manifestation, :lieu => nil)
	    helper.lieu(@manif_lieu_blank).should eql("") 
	    helper.lieu(@manif_lieu_nil).should eql("")	    
	  end

	  it "returns an expressive String with the action's lieu" do
	    helper.lieu(FactoryGirl.create(:manifestation)).should eql(" Lieu : qqpart") 	    
	  end
	end

end
