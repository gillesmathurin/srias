# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/contacts/new.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contact] = stub_model(Contact,
      :new_record? => true,
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    )
  end

  it "renders new contact form" do
    render

    response.should have_tag("form[action=?][method=post]", contacts_path) do
      with_tag("input#contact_nom[name=?]", "contact[nom]")
      with_tag("input#contact_tel[name=?]", "contact[tel]")
      with_tag("input#contact_mail[name=?]", "contact[mail]")
    end
  end
end
