require 'spec_helper'

describe "fiche_pratiques/index" do
  before(:each) do
    assign(:fiche_pratiques, [
      stub_model(FichePratique,
        :title => "Title",
        :content => "MyText",
        :external_link => "External Link"
      ),
      stub_model(FichePratique,
        :title => "Title",
        :content => "MyText",
        :external_link => "External Link"
      )
    ])
  end

  it "renders a list of fiche_pratiques" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "External Link".to_s, :count => 2
  end
end
