# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Partenaire do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Partenaire.create!(@valid_attributes)
  end

  it "should require a valid link if present" do
    Partenaire.new(:link => "bad link").should_not be_valid  
    Partenaire.new(:link => "").should be_valid      
  end
end
