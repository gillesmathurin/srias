require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :nom => "MyString",
      :prenom => "MyString",
      :telephone => "MyString",
      :administration => "MyString",
      :portable => "MyString",
      :email => "MyString",
      :demande => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_nom", :name => "message[nom]"
      assert_select "input#message_prenom", :name => "message[prenom]"
      assert_select "input#message_telephone", :name => "message[telephone]"
      assert_select "input#message_administration", :name => "message[administration]"
      assert_select "input#message_portable", :name => "message[portable]"
      assert_select "input#message_email", :name => "message[email]"
      assert_select "textarea#message_demande", :name => "message[demande]"
    end
  end
end
