require 'spec_helper'

describe Lien do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :adresse => "value for adresse"
    }
  end

  it "should create a new instance given valid attributes" do
    Lien.create!(@valid_attributes)
  end
end
