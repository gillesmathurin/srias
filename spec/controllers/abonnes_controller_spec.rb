require 'spec_helper'

describe AbonnesController do

  def mock_abonne(stubs={})
    @mock_abonne ||= mock_model(Abonne, stubs)
  end

  describe "GET index" do
    it "assigns all abonnes as @abonnes" do
      Abonne.stub(:find).with(:all).and_return([mock_abonne])
      get :index
      assigns[:abonnes].should == [mock_abonne]
    end
  end

  describe "GET show" do
    it "assigns the requested abonne as @abonne" do
      Abonne.stub(:find).with("37").and_return(mock_abonne)
      get :show, :id => "37"
      assigns[:abonne].should equal(mock_abonne)
    end
  end

  describe "GET new" do
    it "assigns a new abonne as @abonne" do
      Abonne.stub(:new).and_return(mock_abonne)
      get :new
      assigns[:abonne].should equal(mock_abonne)
    end
  end

  describe "GET edit" do
    it "assigns the requested abonne as @abonne" do
      Abonne.stub(:find).with("37").and_return(mock_abonne)
      get :edit, :id => "37"
      assigns[:abonne].should equal(mock_abonne)
    end
  end

  describe "POST create" do
    before(:each) do
      Abonne.stub(:new)
    end
    describe "with valid params" do      
      it "assigns a newly created abonne as @abonne" do      
        Abonne.stub(:new).with({'these' => 'params'}).and_return(mock_abonne(:save => true))
        post :create, :abonne => {:these => 'params'}
        assigns[:abonne].should equal(mock_abonne)
      end

      it "redirects to the created abonne" do
        Abonne.stub(:new).and_return(mock_abonne(:save => true))
        post :create, :abonne => {}
        response.should redirect_to(abonne_url(mock_abonne))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved abonne as @abonne" do
        Abonne.stub(:new).with({'these' => 'params'}).and_return(mock_abonne(:save => false))
        post :create, :abonne => {:these => 'params'}
        assigns[:abonne].should equal(mock_abonne)
      end

      it "re-renders the 'new' template" do
        Abonne.stub(:new).and_return(mock_abonne(:save => false))
        post :create, :abonne => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested abonne" do
        Abonne.should_receive(:find).with("37").and_return(mock_abonne)
        mock_abonne.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :abonne => {:these => 'params'}
      end

      it "assigns the requested abonne as @abonne" do
        Abonne.stub(:find).and_return(mock_abonne(:update_attributes => true))
        put :update, :id => "1"
        assigns[:abonne].should equal(mock_abonne)
      end

      it "redirects to the abonne" do
        Abonne.stub(:find).and_return(mock_abonne(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(abonne_url(mock_abonne))
      end
    end

    describe "with invalid params" do
      it "updates the requested abonne" do
        Abonne.should_receive(:find).with("37").and_return(mock_abonne)
        mock_abonne.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :abonne => {:these => 'params'}
      end

      it "assigns the abonne as @abonne" do
        Abonne.stub(:find).and_return(mock_abonne(:update_attributes => false))
        put :update, :id => "1"
        assigns[:abonne].should equal(mock_abonne)
      end

      it "re-renders the 'edit' template" do
        Abonne.stub(:find).and_return(mock_abonne(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested abonne" do
      Abonne.should_receive(:find).with("37").and_return(mock_abonne)
      mock_abonne.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the abonnes list" do
      Abonne.stub(:find).and_return(mock_abonne(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(abonnes_url)
    end
  end

end
