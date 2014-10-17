require 'spec_helper'

describe "fiche_pratiques/show" do
  before(:each) do
    @fiche_pratique = assign(:fiche_pratique, stub_model(FichePratique,
      :title => "Title",
      :content => "MyText",
      :external_link => "External Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/External Link/)
  end
end
