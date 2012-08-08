require 'spec_helper'

describe "prestataires/edit" do
  before(:each) do
    @prestataire = assign(:prestataire, stub_model(Prestataire,
      :nom => "MyString",
      :website => "MyString",
      :tel => "MyString",
      :mob => "MyString",
      :fax => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit prestataire form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prestataires_path(@prestataire), :method => "post" do
      assert_select "input#prestataire_nom", :name => "prestataire[nom]"
      assert_select "input#prestataire_website", :name => "prestataire[website]"
      assert_select "input#prestataire_tel", :name => "prestataire[tel]"
      assert_select "input#prestataire_mob", :name => "prestataire[mob]"
      assert_select "input#prestataire_fax", :name => "prestataire[fax]"
      assert_select "textarea#prestataire_description", :name => "prestataire[description]"
    end
  end
end
