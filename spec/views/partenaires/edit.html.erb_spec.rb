require 'spec_helper'

describe "/partenaires/edit.html.erb" do
  include PartenairesHelper

  before(:each) do
    assigns[:partenaire] = @partenaire = stub_model(Partenaire,
      :new_record? => false,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders the edit partenaire form" do
    render

    response.should have_tag("form[action=#{partenaire_path(@partenaire)}][method=post]") do
      with_tag('input#partenaire_nom[name=?]', "partenaire[nom]")
      with_tag('textarea#partenaire_description[name=?]', "partenaire[description]")
    end
  end
end
