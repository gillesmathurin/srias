# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/liens/new.html.erb" do
  include LiensHelper

  before(:each) do
    assigns[:lien] = @lien = stub_model(Lien,
      :new_record? => true,
      :nom => "value for nom",
      :adresse => "value for adresse"
    )
  end

  it "renders new lien form" do
    render

    rendered.should have_selector("form", :method => "post", :action => liens_path) do |form|
      form.should have_selector("input",
        :type => "text",
        :name => "lien[nom]",
        :value => "value for nom")
      form.should have_selector("input",
        :type => "text",
        :name => "lien[adresse]",
        :value => "value for adresse")
    end
  end
end
