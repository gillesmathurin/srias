# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Category do
	before(:each) do
	  @valid_attributes = { nom: "Nom Categorie" }
	end
  
  it "is invalid without the 'nom' attribute" do
    Category.new().should_not be_valid
  end

  it "is valid with the 'nom' attribute" do
    Category.new(@valid_attributes).should be_valid
  end
end