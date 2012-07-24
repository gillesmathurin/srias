# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/abonnes/edit.html.erb" do
  include AbonnesHelper

  before(:each) do
    assigns[:abonne] = @abonne = stub_model(Abonne,
      :new_record? => false,
      :email => "value for email"
    )
  end

  it "renders the edit abonne form" do
    render

    rendered.should have_selector("form", :action => abonnes_path, :method => "post") do |form|
      form.should have_selector("input", :type => "text", :name => "abonne[email]", :value => "value for email")      
    end
  end
end
