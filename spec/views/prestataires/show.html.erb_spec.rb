require 'spec_helper'

describe "prestataires/show" do
  before(:each) do
    @prestataire = assign(:prestataire, stub_model(Prestataire,
      :nom => "Nom",
      :website => "Website",
      :tel => "Tel",
      :mob => "Mob",
      :fax => "Fax",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nom/)
    rendered.should match(/Website/)
    rendered.should match(/Tel/)
    rendered.should match(/Mob/)
    rendered.should match(/Fax/)
    rendered.should match(/MyText/)
  end
end
