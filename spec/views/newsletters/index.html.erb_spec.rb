require 'spec_helper'

describe "/newsletters/index.html.erb" do
  include NewslettersHelper

  before(:each) do
    assigns[:newsletters] = [
      stub_model(Newsletter,
        :titre => "value for titre",
        :sommaire => "value for sommaire",
        :content => "value for content",
        :preview => 
      ),
      stub_model(Newsletter,
        :titre => "value for titre",
        :sommaire => "value for sommaire",
        :content => "value for content",
        :preview => 
      )
    ]
  end

  it "renders a list of newsletters" do
    render
    response.should have_tag("tr>td", "value for titre".to_s, 2)
    response.should have_tag("tr>td", "value for sommaire".to_s, 2)
    response.should have_tag("tr>td", "value for content".to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
  end
end
