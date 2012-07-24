# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/newsletters/new.html.erb" do
  include NewslettersHelper

  before(:each) do
    assigns[:newsletter] = @newsletter = mock_model(Newsletter,
      :titre => "value for titre",
      :sommaire => "value for sommaire", 
      :content => "value for content")
  end

  it "renders new newsletter form" do
    render
    rendered.should have_selector("form", :action => newsletters_path, :method => "post") do |form|
      form.should have_selector("input",
        :type => "text",
        :name => "newsletter[titre]",
        :value => "value for titre")
      form.should have_selector("input",
        :type => "textarea",
        :name => "newsletter[sommaire]",
        :value => "value for sommaire")
      form.should have_selector("input",
        :type => "textarea",
        :name => "newsletter[content|",
        :value => "value for content")
    end
  end
end
