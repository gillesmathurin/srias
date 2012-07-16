# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/missions/new.html.erb" do
  include MissionsHelper

  before(:each) do
    assigns[:mission] = stub_model(Mission,
      :new_record? => true,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders new mission form" do
    render

    response.should have_tag("form[action=?][method=post]", missions_path) do
      with_tag("input#mission_nom[name=?]", "mission[nom]")
      with_tag("textarea#mission_description[name=?]", "mission[description]")
    end
  end
end
