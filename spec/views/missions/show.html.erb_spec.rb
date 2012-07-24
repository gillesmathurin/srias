# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/missions/show.html.erb" do
  include MissionsHelper
  before(:each) do
    assigns[:mission] = @mission = stub_model(Mission,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("value for nom")
    rendered.should have_content("value for description")
  end
end
