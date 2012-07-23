# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/liens/index.html.erb" do
  include LiensHelper

  before(:each) do
    # assigns[:liens] = 
    @liens = [
      stub_model(Lien,
        :nom => "value for nom",
        :adresse => "value for adresse"
      ),
      stub_model(Lien,
        :nom => "value for nom",
        :adresse => "value for adresse"
      )
    ]
    assign(:liens, @liens)
  end

  it "renders a list of liens" do
    pending("find how to stub authlogic current_user in views spec")
    render
    rendered.should have_tag("tr>td", "value for nom".to_s, 2)
    rendered.should have_tag("tr>td", "value for adresse".to_s, 2)
  end
end
