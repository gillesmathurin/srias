require 'spec_helper'

describe "/missions/edit.html.erb" do
  include MissionsHelper

  before(:each) do
    assigns[:mission] = @mission = stub_model(Mission,
      :new_record? => false,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders the edit mission form" do
    render

    response.should have_tag("form[action=#{mission_path(@mission)}][method=post]") do
      with_tag('input#mission_nom[name=?]', "mission[nom]")
      with_tag('textarea#mission_description[name=?]', "mission[description]")
    end
  end
end
