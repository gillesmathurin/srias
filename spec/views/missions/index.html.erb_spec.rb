# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/missions/index.html.erb" do
  include MissionsHelper

  before(:each) do
    assigns[:missions] = [
      stub_model(Mission,
        :nom => "value for nom",
        :description => "value for description"
      ),
      stub_model(Mission,
        :nom => "value for nom",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of missions" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
