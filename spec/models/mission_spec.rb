# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Mission do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Mission.create!(@valid_attributes)
  end
  
  it "requires a nom" do
    @mission = Mission.new
    @mission.should have(1).error_on(:nom)
  end
  
  it "doesn't require a description" do
    @mission = Mission.new
    @mission.should_not have(1).error_on(:description)
  end

  describe "to_param" do
    it "returns a human readable id" do
      mission = FactoryGirl.create(:mission, :nom => "ma mission")
      mission.to_param.should eql("#{mission.id}-ma-mission")
    end    
  end
end
