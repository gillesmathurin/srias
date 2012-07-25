# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/abonnes/index.html.erb" do
  include AbonnesHelper

  before(:each) do
    assigns[:abonnes] = @abonnes = [
      stub_model(Abonne,
        :email => "value for email"
      ),
      stub_model(Abonne,
        :email => "value for email"
      )
    ]
  end

  it "renders a list of abonnes" do
    pending()
    render
    rendered.should have_content("value for email")
  end
end
