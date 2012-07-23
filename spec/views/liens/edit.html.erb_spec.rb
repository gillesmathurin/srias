# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/liens/edit.html.erb" do
  include LiensHelper

  before(:each) do
    assigns[:lien] = @lien = stub_model(Lien,
      :new_record? => false,
      :nom => "value for nom",
      :adresse => "value for adresse"
    )
  end

  it "renders the edit lien form" do
    render
    
    rendered.should have_selector("form", :method => "post", :action => lien_path(@lien)) do |form|
      form.should have_selector("input",
       :type => "text",
       :name => "lien[nom]")
    end
  end
end
