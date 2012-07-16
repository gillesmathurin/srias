# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/abonnes/show.html.erb" do
  include AbonnesHelper
  before(:each) do
    assigns[:abonne] = @abonne = stub_model(Abonne,
      :email => "value for email"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ email/)
  end
end
