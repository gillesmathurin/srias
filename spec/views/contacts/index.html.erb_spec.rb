# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/contacts/index.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contacts] = [
      stub_model(Contact,
        :nom => "value for nom",
        :tel => "value for tel",
        :mail => "value for mail"
      ),
      stub_model(Contact,
        :nom => "value for nom",
        :tel => "value for tel",
        :mail => "value for mail"
      )
    ]
  end

  it "renders a list of contacts" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for tel".to_s, 2)
    response.should have_tag("tr>td", "value for mail".to_s, 2)
  end
end
