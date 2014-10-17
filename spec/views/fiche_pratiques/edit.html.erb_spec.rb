require 'spec_helper'

describe "fiche_pratiques/edit" do
  before(:each) do
    @fiche_pratique = assign(:fiche_pratique, stub_model(FichePratique,
      :title => "MyString",
      :content => "MyText",
      :external_link => "MyString"
    ))
  end

  it "renders the edit fiche_pratique form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fiche_pratique_path(@fiche_pratique), "post" do
      assert_select "input#fiche_pratique_title[name=?]", "fiche_pratique[title]"
      assert_select "textarea#fiche_pratique_content[name=?]", "fiche_pratique[content]"
      assert_select "input#fiche_pratique_external_link[name=?]", "fiche_pratique[external_link]"
    end
  end
end
