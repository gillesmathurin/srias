require 'spec_helper'

describe "/contacts/edit.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :new_record? => false,
      :nom => "value for nom",
      :tel => "value for tel",
      :mail => "value for mail"
    )
  end

  it "renders the edit contact form" do
    render

    response.should have_tag("form[action=#{contact_path(@contact)}][method=post]") do
      with_tag('input#contact_nom[name=?]', "contact[nom]")
      with_tag('input#contact_tel[name=?]', "contact[tel]")
      with_tag('input#contact_mail[name=?]', "contact[mail]")
    end
  end
end
