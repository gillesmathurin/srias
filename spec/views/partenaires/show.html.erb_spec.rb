# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/partenaires/show.html.erb" do
  include PartenairesHelper
  before(:each) do
    assigns[:partenaire] = @partenaire = stub_model(Partenaire,
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
