# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/manifestations/edit.html.erb" do
  include ManifestationsHelper

  before(:each) do
    assigns[:manifestation] = @manifestation = stub_model(Manifestation,
      :new_record? => false,
      :nom => "value for nom",
      :lieu => "value for lieu",
      :description => "value for description"
    )
  end

  it "renders the edit manifestation form" do
    render

    response.should have_tag("form[action=#{manifestation_path(@manifestation)}][method=post]") do
      with_tag('input#manifestation_nom[name=?]', "manifestation[nom]")
      with_tag('input#manifestation_lieu[name=?]', "manifestation[lieu]")
      with_tag('textarea#manifestation_description[name=?]', "manifestation[description]")
    end
  end
end
