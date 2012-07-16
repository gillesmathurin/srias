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

    response.should have_tag("form[action=#{lien_path(@lien)}][method=post]") do
      with_tag('input#lien_nom[name=?]', "lien[nom]")
      with_tag('input#lien_adresse[name=?]', "lien[adresse]")
    end
  end
end
