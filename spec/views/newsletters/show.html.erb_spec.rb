require 'spec_helper'

describe "/newsletters/show.html.erb" do
  include NewslettersHelper
  before(:each) do
    assigns[:newsletter] = @newsletter = stub_model(Newsletter,
      :titre => "value for titre",
      :sommaire => "value for sommaire",
      :content => "value for content",
      :preview => 
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ titre/)
    response.should have_text(/value\ for\ sommaire/)
    response.should have_text(/value\ for\ content/)
    response.should have_text(//)
  end
end
