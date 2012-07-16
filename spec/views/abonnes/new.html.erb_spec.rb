# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/abonnes/new.html.erb" do
  include AbonnesHelper

  before(:each) do
    assigns[:abonne] = stub_model(Abonne,
      :new_record? => true,
      :email => "value for email"
    )
  end

  it "renders new abonne form" do
    render

    response.should have_tag("form[action=?][method=post]", abonnes_path) do
      with_tag("input#abonne_email[name=?]", "abonne[email]")
    end
  end
end
