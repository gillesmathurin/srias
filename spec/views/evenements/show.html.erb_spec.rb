require 'spec_helper'

describe "/evenements/show.html.erb" do
  include EvenementsHelper
  before(:each) do
    assigns[:evenement] = @evenement = stub_model(Evenement)
  end

  it "renders attributes in <p>" do
    render
  end
end
