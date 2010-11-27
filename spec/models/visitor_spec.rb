require 'spec_helper'

describe Visitor do
  before(:each) do
    @valid_attributes = {
      :ip => "value for ip"
    }
  end

  it "should create a new instance given valid attributes" do
    Visitor.create!(@valid_attributes)
  end
end
