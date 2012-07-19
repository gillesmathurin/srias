# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :email => "foo@bar.com",
      :password => "value for crypted_password",
      :password_confirmation => "value for crypted_password",
      :password_salt => "value for password_salt",
      :persistence_token => "value for persistence_token"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  describe "role?(role)" do
    before(:each) do
      @user = FactoryGirl.create(:user, :role => "admin")
    end

    it "should return true if user has got given role false otherwise" do
      @user.role?("admin").should be_true
      @user.role?("redacteur").should be_false
    end
  end
end
