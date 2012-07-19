# -*- encoding : utf-8 -*-
require 'spec_helper'

describe NewsletterMailer do
  
  describe "newsletter(abonne, newsletter)" do
  	before(:each) do
  	  @nl = FactoryGirl.create(:newsletter)
  	  @email = NewsletterMailer.newsletter("example.com", @nl).deliver
  	end

    it "sends the given newsletter to the specified abonne" do
      ActionMailer::Base.deliveries.should_not be_empty
      @email.to.should eql(["example.com"])
      @email.subject.should eql("Newsletter du Srias de Guadeloupe")
      @email.encoded.should =~ /<h1>un titre<\/h1>/      
    end

    context "with a file attachment" do
      before(:each) do
        
      end

      it "send the given newsletter to the specified abonne with the file attachment"
    end
  end
end