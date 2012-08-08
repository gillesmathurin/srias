require 'spec_helper'

describe "prestataires/index" do
  before(:each) do
    assign(:prestataires, [
      stub_model(Prestataire,
        :nom => "Nom",
        :website => "Website",
        :tel => "Tel",
        :mob => "Mob",
        :fax => "Fax",
        :description => "MyText"
      ),
      stub_model(Prestataire,
        :nom => "Nom",
        :website => "Website",
        :tel => "Tel",
        :mob => "Mob",
        :fax => "Fax",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of prestataires" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Mob".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
