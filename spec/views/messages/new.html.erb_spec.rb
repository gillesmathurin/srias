require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :nom => "MyString",
      :prenom => "MyString",
      :telephone => "MyString",
      :administration => "MyString",
      :portable => "MyString",
      :email => "MyString",
      :demande => "MyText"
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
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
