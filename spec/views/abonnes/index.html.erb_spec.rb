# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/abonnes/index.html.erb" do
  include AbonnesHelper

  before(:each) do
    assigns[:abonnes] = [
      stub_model(Abonne,
        :email => "value for email"
      ),
      stub_model(Abonne,
        :email => "value for email"
      )
    ]
  end

  it "renders a list of abonnes" do
    render
    response.should have_tag("tr>td", "value for email".to_s, 2)
  end
end
