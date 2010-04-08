require 'spec_helper'

describe "/liens/new.html.erb" do
  include LiensHelper

  before(:each) do
    assigns[:lien] = stub_model(Lien,
      :new_record? => true,
      :nom => "value for nom",
      :adresse => "value for adresse"
    )
  end

  it "renders new lien form" do
    render

    response.should have_tag("form[action=?][method=post]", liens_path) do
      with_tag("input#lien_nom[name=?]", "lien[nom]")
      with_tag("input#lien_adresse[name=?]", "lien[adresse]")
    end
  end
end
