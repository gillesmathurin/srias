require 'spec_helper'

describe "/texte_accueils/edit.html.erb" do
  include TexteAccueilsHelper

  before(:each) do
    assigns[:texte_accueil] = @texte_accueil = stub_model(TexteAccueil,
      :new_record? => false,
      :content => "value for content"
    )
  end

  it "renders the edit texte_accueil form" do
    render

    response.should have_tag("form[action=#{texte_accueil_path(@texte_accueil)}][method=post]") do
      with_tag('textarea#texte_accueil_content[name=?]', "texte_accueil[content]")
    end
  end
end
