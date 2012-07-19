# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Newsletter do
  before(:each) do
    @valid_attributes = {
      :titre => "value for titre",
      :sommaire => "value for sommaire",
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Newsletter.create!(@valid_attributes)
  end

  describe "deliver_test" do
    before(:each) do
      @nl = FactoryGirl.create(:newsletter)
      @nl.deliver_test
    end

    it "should be set to be delivered to gillesmath@me.com and guillou.g3@wanadoo.fr" do
      @nl.delivered_at.should_not be(nil)
      ActionMailer::Base.deliveries.should_not be_empty
      ActionMailer::Base.deliveries.should have(2).records
      ActionMailer::Base.deliveries[0].to.should eql(["gillesmath@me.com"])
      ActionMailer::Base.deliveries[1].to.should eql(["guillou.g3@wanadoo.fr"])
    end
  end

  describe "deliver" do
    it "should send the newsletter to all abonnes" do
      pending("As the deliver_test method works, no hurry to write a spec for this one")
    end
  end
end
