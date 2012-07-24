# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/contacts/edit.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :new_record? => false,
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    )
  end

  it "renders the edit contact form" do
    render

    rendered.should have_selector("form", :method => "post", :action => contact_path(@contact)) do |form|
      form.should have_selector("input",
        :type => "text",
        :value => "value for nom",
        :name => "contact[nom]")
      form.should have_selector("input",
        :type => "text",
        :name => "contact[tel]",
        :value => "value for tel")
      form.should have_selector("input",
        :type => "text",
        :name => "contact[mail]",
        :value => "value for mail")
    end
  end
end
