require 'spec_helper'

describe "information/new" do
  before(:each) do
    assign(:information, stub_model(Information,
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new information form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => information_index_path, :method => "post" do
      assert_select "input#information_title", :name => "information[title]"
      assert_select "textarea#information_content", :name => "information[content]"
    end
  end
end
