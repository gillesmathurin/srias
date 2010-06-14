require 'spec_helper'

describe "/texte_accueils/show.html.erb" do
  include TexteAccueilsHelper
  before(:each) do
    assigns[:texte_accueil] = @texte_accueil = stub_model(TexteAccueil,
      :content => "value for content"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
  end
end
