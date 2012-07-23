# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "/liens/show.html.erb" do
  include LiensHelper
  include Authlogic::TestCase
  fixtures :users

  def current_user
    @user ||= users(:ben)
  end

  before(:each) do
    activate_authlogic
    UserSession.create(current_user)
    UserSession.stub(:find).and_return(current_user)
    assigns[:lien] = @lien = stub_model(Lien,
     :nom => "value for nom",
     :adresse => "value for adresse")
  end

  it "renders attributes in <p>" do
    pending("find how to stub current_user")
    render

    rendered.should have_text(/value\ for\ nom/)
    rendered.should have_text(/value\ for\ adresse/)
  end
end
