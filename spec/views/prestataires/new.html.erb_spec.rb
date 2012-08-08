require 'spec_helper'

describe "prestataires/new" do
  before(:each) do
    assign(:prestataire, stub_model(Prestataire,
      :nom => "MyString",
      :website => "MyString",
      :tel => "MyString",
      :mob => "MyString",
      :fax => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new prestataire form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prestataires_path, :method => "post" do
      assert_select "input#prestataire_nom", :name => "prestataire[nom]"
      assert_select "input#prestataire_website", :name => "prestataire[website]"
      assert_select "input#prestataire_tel", :name => "prestataire[tel]"
      assert_select "input#prestataire_mob", :name => "prestataire[mob]"
      assert_select "input#prestataire_fax", :name => "prestataire[fax]"
      assert_select "textarea#prestataire_description", :name => "prestataire[description]"
    end
  end
end
