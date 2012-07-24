# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/texte_accueils/edit.html.erb" do
  include TexteAccueilsHelper

  before(:each) do
    assigns[:texte_accueil] = @texte_accueil = stub_model(TexteAccueil,
      :new_record? => false,
      :content => "value for content",
      :titre => "value for titre"
    )
  end

  it "renders the edit texte_accueil form" do
    render

    rendered.should have_selector("form", :method => "post", :action => texte_accueil_path(@texte_accueil)) do |form|
      form.should have_selector("input", :type => "text", :name => "texte_accueil[titre]")
      form.should have_selector("input", :type => "textarea", :name => "texte_accueil[contenu]")
    end
  end
end
