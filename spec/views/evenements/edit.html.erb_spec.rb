require 'spec_helper'

describe "/evenements/edit.html.erb" do
  include EvenementsHelper

  before(:each) do
    assigns[:evenement] = @evenement = stub_model(Evenement,
      :new_record? => false
    )
  end

  it "renders the edit evenement form" do
    render

    response.should have_tag("form[action=#{evenement_path(@evenement)}][method=post]") do
    end
  end
end
