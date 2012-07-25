# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/contacts/show.html.erb" do
  include ContactsHelper
  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    )
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("value for nom")
    rendered.should have_content("value for tel")
    rendered.should have_content("value for mail")
  end
end
