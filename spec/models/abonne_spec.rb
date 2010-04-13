require 'spec_helper'

describe Abonne do
  before(:each) do
    @valid_attributes = {
      :email => "value for email"
    }
  end

  it "should create a new instance given valid attributes" do
    Abonne.create!(@valid_attributes)
  end
end
