# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PartenairesHelper do

	describe "image_present?(partenaire)" do
	  it "returns true if partenaire has got a logo in thumb style, false otherwise" do
	    @with_logo_partenaire = FactoryGirl.create(:partenaire_with_logo_attachment)
	    @without_logo_partenaire = FactoryGirl.create(:partenaire)
	    helper.image_present?(@with_logo_partenaire).should eql(true) 
	    helper.image_present?(@without_logo_partenaire).should eql(false)	    
	  end
	end
end
