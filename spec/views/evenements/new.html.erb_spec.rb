require 'spec_helper'

describe "/evenements/new.html.erb" do
  include EvenementsHelper

  before(:each) do
    assigns[:evenement] = stub_model(Evenement,
      :new_record? => true
    )
  end

  it "renders new evenement form" do
    render

    response.should have_tag("form[action=?][method=post]", evenements_path) do
    end
  end
end
