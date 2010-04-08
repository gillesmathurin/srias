require 'spec_helper'

describe "/liens/index.html.erb" do
  include LiensHelper

  before(:each) do
    assigns[:liens] = [
      stub_model(Lien,
        :nom => "value for nom",
        :adresse => "value for adresse"
      ),
      stub_model(Lien,
        :nom => "value for nom",
        :adresse => "value for adresse"
      )
    ]
  end

  it "renders a list of liens" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for adresse".to_s, 2)
  end
end
