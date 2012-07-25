# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/newsletters/index.html.erb" do
  include NewslettersHelper
  include Authlogic::TestCase

  def current_user(stubs = {})
    @current_user ||= mock_model(User, stubs)
  end

  def user_session(stubs = {}, user_stubs = {})
    @current_user_session ||= mock_model(UserSession, {:user => current_user(user_stubs)}.merge(stubs))
  end

  def login(session_stubs = {}, user_stubs = {})
    UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs))
  end

  def logout
    @user_session = nil
  end

  context "without a logged-in user" do
    before(:each) do
      activate_authlogic
      logout()
      assigns[:newsletters] = @newsletters = [ mock_model(Newsletter, :titre => "value for titre",
       :sommaire => "value for sommaire", :content => "value for content") ]
      controller.stub(:current_user) { mock_model(User) }
    end

    it "renders a list of newsletters" do
      pending("find how to mock authlogic current user in views spec")
      render
      rendered.should have_selector("tr>td") do |row|
        row.should have_content("value for titre")
      end
      rendered.should have_selector("tr>td") do |row|
        row.should have_content("value for sommaire")
      end
      rendered.should have_selector("tr>td") do |row|
        row.should have_content("value for content")
      end
    end
  end

  context "with a logged-in user" do
    before(:each) do
      activate_authlogic
      assigns[:current_user] = current_user()
      assigns[:newsletters] = @newsletters = [ mock_model(Newsletter, :titre => "value for titre",
       :sommaire => "value for sommaire", :content => "value for content") ]
    end

    it "renders a list of newsletters" do
      pending("find how to mock authlogic current user in views spec")
      assign(:current_user, current_user())
      render
      rendered.should have_selector("tr>td") do |row|
        row.should have_content("value for titre")
      end
      rendered.should have_selector("tr>td") do |row|
        row.should have_content("value for sommaire")
      end
      rendered.should have_selector("tr>td") do |row|
        row.should have_content("value for content")
      end
    end
  end
end