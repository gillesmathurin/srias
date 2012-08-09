require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :nom => "Nom",
        :prenom => "Prenom",
        :telephone => "Telephone",
        :administration => "Administration",
        :portable => "Portable",
        :email => "Email",
        :demande => "MyText"
      ),
      stub_model(Message,
        :nom => "Nom",
        :prenom => "Prenom",
        :telephone => "Telephone",
        :administration => "Administration",
        :portable => "Portable",
        :email => "Email",
        :demande => "MyText"
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
    assert_select "tr>td", :text => "Administration".to_s, :count => 2
    assert_select "tr>td", :text => "Portable".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
