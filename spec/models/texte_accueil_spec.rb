# -*- encoding : utf-8 -*-
require 'spec_helper'

describe TexteAccueil do
  before(:each) do
    @valid_attributes = {
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    TexteAccueil.create!(@valid_attributes)
  end
end
