# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/manifestations/index.html.erb" do
  include ManifestationsHelper

  before(:each) do
    assigns[:manifestations] = [
      stub_model(Manifestation,
        :nom => "value for nom",
        :lieu => "value for lieu",
        :description => "value for description"
      ),
      stub_model(Manifestation,
        :nom => "value for nom",
        :lieu => "value for lieu",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of manifestations" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for lieu".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
