# -*- encoding : utf-8 -*-
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
    rendered.should have_content("value for content")
  end
end
