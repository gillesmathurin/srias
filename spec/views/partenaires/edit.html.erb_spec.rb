# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/partenaires/edit.html.erb" do
  include PartenairesHelper

  before(:each) do
    assigns[:partenaire] = @partenaire = stub_model(Partenaire,
      :new_record? => false,
      :nom => "value for nom",
      :description => "value for description"
    )
  end

  it "renders the edit partenaire form" do
    render

    rendered.should have_selector("form", :action => partenaire_path(@partenaire), :method => "post") do |form|
      form.should have_selector("input", :name => "partenaire[nom]")
      form.should have_selector("input", :description => "partenaire[description]")
    end
  end
end
