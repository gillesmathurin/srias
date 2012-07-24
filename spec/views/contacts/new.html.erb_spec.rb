# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/contacts/new.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :new_record? => true,
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    )
  end

  it "renders new contact form" do
    render

    rendered.should have_selector("form", :method => "post", :action => contacts_path) do |form|
      form.should have_selector("input", :type => "text", :name => "contact[nom]")
      form.should have_selector("input", :type => "text", :name => "contact[tel]")
      form.should have_selector("input", :type => "text", :name => "contact[mail]")
    end
  end
end
