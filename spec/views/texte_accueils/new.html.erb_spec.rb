# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/texte_accueils/new.html.erb" do
  include TexteAccueilsHelper

  before(:each) do
    assigns[:texte_accueil] = @texte_accueil = stub_model(TexteAccueil,
      :new_record? => true,
      :content => "value for content"
    )
  end

  it "renders new texte_accueil form" do
    render

    rendered.should have_selector("form", :method => "post", :action => texte_accueils_path) do |form|
      form.should have_selector("input", :type => "textarea", :name => "texte_acceuil[content]")
    end
  end
end
