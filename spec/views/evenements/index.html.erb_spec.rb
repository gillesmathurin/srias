require 'spec_helper'

describe "/evenements/index.html.erb" do
  include EvenementsHelper

  before(:each) do
    assigns[:evenements] = [
      stub_model(Evenement),
      stub_model(Evenement)
    ]
  end

  it "renders a list of evenements" do
    render
  end
end
