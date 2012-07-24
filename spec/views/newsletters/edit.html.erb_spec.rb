# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/newsletters/edit.html.erb" do
  
  include NewslettersHelper

  before(:each) do
    assigns[:newsletter] = @newsletter = mock_model(Newsletter, 
      :titre => "value for titre", 
      :sommaire => "value for sommaire", 
      :content => "value for content")
  end

  it "renders the edit newsletter form" do
    render

    rendered.should have_selector("form", :method => "post", :action => newsletter_path(@newsletter)) do |form|
      form.should have_selector("input",
        :type => "text",
        :value => "value for titre")
      form.should have_selector("input",
        :type => "textarea",
        :value => "value for sommaire")
      form.should have_selector("input",
        :type => "textarea",
        :value => "value for content")
    end
  end
  
end
