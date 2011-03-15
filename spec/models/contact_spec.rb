require 'spec_helper'

describe Contact do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
  
  describe ".to_display" do
    before(:each) do
      @contact = Contact.create!(:nom => "nom", :tel => "0590000000", :email => "mail@example.com", :selected => true)
      @contact2 = Contact.create!(:nom => "nom2", :tel => "0690000000", :email => "mail2@example.com", :selected => false)
    end
    
    it "fetches all the selected contacts" do
      results = Contact.to_display
      results.should have(1).record
      results.should include(@contact)
    end
  end
end
