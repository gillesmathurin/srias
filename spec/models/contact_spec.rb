require 'spec_helper'

describe Contact do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
end
