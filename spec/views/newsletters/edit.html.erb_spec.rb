require 'spec_helper'

describe "/newsletters/edit.html.erb" do
  
  include NewslettersHelper

  before(:each) do
    assigns[:newsletter] = mock_model(Newsletter, :titre => "value for titre", :sommaire => "value for sommaire", :content => "value for content")
  end

  it "renders the edit newsletter form" do
    render
    # response.should have_tag("form[action=][method=post]" do
    #   with_tag('input#newsletter_titre[name=?]', "newsletter[titre]")
    #   with_tag('textarea#newsletter_sommaire[name=?]', "newsletter[sommaire]")
    #   with_tag('textarea#newsletter_content[name=?]', "newsletter[content]")
    #   with_tag('input#newsletter_preview[name=?]', "newsletter[preview]")
    # end
  end
  
end
