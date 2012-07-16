# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/texte_accueils/new.html.erb" do
  include TexteAccueilsHelper

  before(:each) do
    assigns[:texte_accueil] = stub_model(TexteAccueil,
      :new_record? => true,
      :content => "value for content"
    )
  end

  it "renders new texte_accueil form" do
    render

    response.should have_tag("form[action=?][method=post]", texte_accueils_path) do
      with_tag("textarea#texte_accueil_content[name=?]", "texte_accueil[content]")
    end
  end
end
