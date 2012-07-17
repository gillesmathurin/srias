# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Annonce do

	describe "self.courantes(hide_time)" do
		context "without a hide time" do			
			it "finds all the annonce which starts before now and ends after now" do
				annonce = FactoryGirl.create(:annonce)
				results = Annonce.courantes(nil)
				results.should have(1).record
				results[0].should eql(annonce) 				 				 				
			end	  
		end

		context "with a hide_time" do
		  it "finds all the annonces which have been updated or start after the given hide_time" do
		    annonce = FactoryGirl.create(:annonce, :updated_at => (Time.now + 2.hours) )
		    annonce2 = FactoryGirl.create(:annonce)
		    results = Annonce.courantes(Time.now)
		    results.should have(1).records
		    Annonce.courantes(Time.now - 1.day).should have(2).records
		  end
		end
	end
  
end