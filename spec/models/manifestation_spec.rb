# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Manifestation do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :lieu => "value for lieu",
      :date_debut => Time.now,
      :date_fin => Time.now,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Manifestation.create!(@valid_attributes)
  end
end
