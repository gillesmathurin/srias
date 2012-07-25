# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/texte_accueils/index.html.erb" do
  include TexteAccueilsHelper

  before(:each) do
    assigns[:texte_accueils] = @texte_accueils = [
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
    rendered.should have_content("value for content")
  end
end
