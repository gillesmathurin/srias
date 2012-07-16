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
end
