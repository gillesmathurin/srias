require 'spec_helper'

describe "/partenaires/index.html.erb" do
  include PartenairesHelper

  before(:each) do
    assigns[:partenaires] = [
      stub_model(Partenaire,
        :nom => "value for nom",
        :description => "value for description"
      ),
      stub_model(Partenaire,
        :nom => "value for nom",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of partenaires" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
