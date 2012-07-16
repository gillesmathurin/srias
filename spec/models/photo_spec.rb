# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Photo do
  before(:each) do
    @valid_attributes = {
      :photo_file_name => "value for photo_file_name",
      :photo_content_type => "value for photo_content_type",
      :photo_file_size => 1,
      :photo_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Photo.create!(@valid_attributes)
  end
end
