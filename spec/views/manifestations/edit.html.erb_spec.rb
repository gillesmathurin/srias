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

    rendered.should have_selector("form", :method => "post", :action => manifestation_path(@manifestation)) do |form|
      form.should have_selector("input",
        :type => "text",
        :name => "manifestation[nom]")
      form.should have_selector("input",
        :type => "text",
        :name => "manifestation[lieu]")
      form.should have_selector("input",
        :type => "textarea",
        :name => "manifestation[description]")
    end
  end
end
