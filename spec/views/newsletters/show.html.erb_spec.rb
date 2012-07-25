# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/newsletters/show.html.erb" do
  include NewslettersHelper
  before(:each) do
    assign(:newsletter, mock_model(Newsletter, :titre => "value for titre",
     :sommaire => "value for sommaire", :content => "value for content"))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("value for titre")
    rendered.should have_content("value for sommaire")
    rendered.should have_content("value for content")
  end
end
