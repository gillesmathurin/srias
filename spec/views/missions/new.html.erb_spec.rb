# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/missions/new.html.erb" do
  include MissionsHelper

  before(:each) do
    assigns[:mission] = @mission = stub_model(Mission,
      :new_record? => true,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders new mission form" do
    render

    rendered.should have_selector("form", :action => mission_path(@mission), :method => "post") do |form|
      form.should have_selector("input", :type => "text", :name => "mission[nom]")
      form.should have_selector("input", :type => "textarea", :name => "mission[description]")
    end
  end
end
