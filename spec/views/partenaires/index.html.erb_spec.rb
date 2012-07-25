# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/partenaires/index.html.erb" do
  include PartenairesHelper

  before(:each) do
    assigns[:partenaires] = @partenaires = [
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
    pending()
    render
    rendered.should have_content("tr>td", "value for nom".to_s, 2)
    rendered.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
