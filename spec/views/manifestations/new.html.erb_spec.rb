# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/manifestations/new.html.erb" do
  include ManifestationsHelper

  before(:each) do
    assigns[:manifestation] = stub_model(Manifestation,
      :new_record? => true,
      :nom => "value for nom",
      :lieu => "value for lieu",
      :description => "value for description"
    )
  end

  it "renders new manifestation form" do
    render

    response.should have_tag("form[action=?][method=post]", manifestations_path) do
      with_tag("input#manifestation_nom[name=?]", "manifestation[nom]")
      with_tag("input#manifestation_lieu[name=?]", "manifestation[lieu]")
      with_tag("textarea#manifestation_description[name=?]", "manifestation[description]")
    end
  end
end
