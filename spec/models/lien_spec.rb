# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Lien do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :adresse => "http://monsiteweb.com"
    }
    @lien = Lien.new    
  end
  
  it "requires a nom" do
    @lien.should have(1).error_on(:nom)
    @lien.should have(1).error_on(:adresse)
  end
end
