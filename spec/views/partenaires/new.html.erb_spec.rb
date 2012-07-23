# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/partenaires/new.html.erb" do
  include PartenairesHelper

  before(:each) do
    assigns[:partenaire] = @partenaire = stub_model(Partenaire,
      :new_record? => true,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders new partenaire form" do
    render

    rendered.should have_selector("form", :method => "post", :action => partenaires_path) do |form|
      form.should have_selector("input",
        :type => "text",
        :name => "partenaire[nom]",
        :value => "value for nom")
      form.should have_selector("input",
        :type => "textarea",
        :name => "partenaire[description]",
        :value => "value for description")
    end
  end
end
