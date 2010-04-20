require 'spec_helper'

describe Evenement do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Evenement.create!(@valid_attributes)
  end
end
