# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/liens/show.html.erb" do
  include LiensHelper
  before(:each) do
    assigns[:lien] = @lien = stub_model(Lien,
      :nom => "value for nom",
      :adresse => "value for adresse"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ adresse/)
  end
end
