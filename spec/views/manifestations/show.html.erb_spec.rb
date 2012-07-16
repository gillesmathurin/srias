# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/manifestations/show.html.erb" do
  include ManifestationsHelper
  before(:each) do
    assigns[:manifestation] = @manifestation = stub_model(Manifestation,
      :nom => "value for nom",
      :lieu => "value for lieu",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ lieu/)
    response.should have_text(/value\ for\ description/)
  end
end
