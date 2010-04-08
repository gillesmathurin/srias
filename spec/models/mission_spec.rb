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
  
  it "requires a description" do
    @mission = Mission.new
    @mission.should have(1).error_on(:description)
  end
end
