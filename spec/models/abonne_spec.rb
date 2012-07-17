# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Abonne do
  before(:each) do
    @valid_attributes = { :email => "gillesmath@me.com" }
    @invalid_attributes = { email: "value for email" }
  end

  it "should create a new instance given valid attributes" do
    Abonne.create!(@valid_attributes)
  end

  it "should not create a new instance given invalid attributes" do
    Abonne.new(@invalid_attributes).should_not be_valid
  end
end
