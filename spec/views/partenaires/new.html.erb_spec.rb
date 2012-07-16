# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/partenaires/new.html.erb" do
  include PartenairesHelper

  before(:each) do
    assigns[:partenaire] = stub_model(Partenaire,
      :new_record? => true,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders new partenaire form" do
    render

    response.should have_tag("form[action=?][method=post]", partenaires_path) do
      with_tag("input#partenaire_nom[name=?]", "partenaire[nom]")
      with_tag("textarea#partenaire_description[name=?]", "partenaire[description]")
    end
  end
end
