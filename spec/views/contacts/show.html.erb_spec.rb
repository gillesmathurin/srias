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
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ tel/)
    response.should have_text(/value\ for\ mail/)
  end
end
