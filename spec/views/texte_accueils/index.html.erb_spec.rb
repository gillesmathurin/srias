require 'spec_helper'

describe "/texte_accueils/index.html.erb" do
  include TexteAccueilsHelper

  before(:each) do
    assigns[:texte_accueils] = [
      stub_model(TexteAccueil,
        :content => "value for content"
      ),
      stub_model(TexteAccueil,
        :content => "value for content"
      )
    ]
  end

  it "renders a list of texte_accueils" do
    render
    response.should have_tag("tr>td", "value for content".to_s, 2)
  end
end
