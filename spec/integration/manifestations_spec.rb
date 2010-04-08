require 'spec_helper'

describe "Manifestations" do
  before(:each) do
    @valid_attributes = {
      :nom => "nom",
      :lieu => "a place",
      :date_debut => Time.now,
      :date_fin => Time.now.tomorrow,
      :description => "value for description"
    }
    @manifestation = Manifestation.new()
  end
  
  it "should create a new instance given valid attributes" do
    Manifestation.create!(@valid_attributes)
  end
  
  it "requires a nom" do
    @manifestation.should have(1).error_on(:nom)
  end
  
  it "requires a lieu" do
    @manifestation.should have(1).error_on(:lieu)
  end
  
  it "requires a date_debut" do
    @manifestation.should have(1).error_on(:date_debut)
  end
end
