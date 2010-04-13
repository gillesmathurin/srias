require 'spec_helper'

describe "/newsletters/edit.html.erb" do
  include NewslettersHelper

  before(:each) do
    assigns[:newsletter] = @newsletter = stub_model(Newsletter,
      :new_record? => false,
      :titre => "value for titre",
      :sommaire => "value for sommaire",
      :content => "value for content",
      :preview => 
    )
  end

  it "renders the edit newsletter form" do
    render

    response.should have_tag("form[action=#{newsletter_path(@newsletter)}][method=post]") do
      with_tag('input#newsletter_titre[name=?]', "newsletter[titre]")
      with_tag('textarea#newsletter_sommaire[name=?]', "newsletter[sommaire]")
      with_tag('textarea#newsletter_content[name=?]', "newsletter[content]")
      with_tag('input#newsletter_preview[name=?]', "newsletter[preview]")
    end
  end
end
