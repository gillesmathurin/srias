require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :nom => "Nom",
      :prenom => "Prenom",
      :telephone => "Telephone",
      :administration => "Administration",
      :portable => "Portable",
      :email => "Email",
      :demande => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nom/)
    rendered.should match(/Prenom/)
    rendered.should match(/Telephone/)
    rendered.should match(/Administration/)
    rendered.should match(/Portable/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
  end
end
