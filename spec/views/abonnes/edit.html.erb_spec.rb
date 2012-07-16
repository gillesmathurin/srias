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

    response.should have_tag("form[action=#{abonne_path(@abonne)}][method=post]") do
      with_tag('input#abonne_email[name=?]', "abonne[email]")
    end
  end
end
