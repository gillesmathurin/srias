require 'spec_helper'

describe TexteAccueilsController do

  def mock_texte_accueil(stubs={})
    @mock_texte_accueil ||= mock_model(TexteAccueil, stubs)
  end

  describe "GET index" do
    it "assigns all texte_accueils as @texte_accueils" do
      TexteAccueil.stub(:find).with(:all).and_return([mock_texte_accueil])
      get :index
      assigns[:texte_accueils].should == [mock_texte_accueil]
    end
  end

  describe "GET show" do
    it "assigns the requested texte_accueil as @texte_accueil" do
      TexteAccueil.stub(:find).with("37").and_return(mock_texte_accueil)
      get :show, :id => "37"
      assigns[:texte_accueil].should equal(mock_texte_accueil)
    end
  end

  describe "GET new" do
    it "assigns a new texte_accueil as @texte_accueil" do
      TexteAccueil.stub(:new).and_return(mock_texte_accueil)
      get :new
      assigns[:texte_accueil].should equal(mock_texte_accueil)
    end
  end

  describe "GET edit" do
    it "assigns the requested texte_accueil as @texte_accueil" do
      TexteAccueil.stub(:find).with("37").and_return(mock_texte_accueil)
      get :edit, :id => "37"
      assigns[:texte_accueil].should equal(mock_texte_accueil)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created texte_accueil as @texte_accueil" do
        TexteAccueil.stub(:new).with({'these' => 'params'}).and_return(mock_texte_accueil(:save => true))
        post :create, :texte_accueil => {:these => 'params'}
        assigns[:texte_accueil].should equal(mock_texte_accueil)
      end

      it "redirects to the created texte_accueil" do
        TexteAccueil.stub(:new).and_return(mock_texte_accueil(:save => true))
        post :create, :texte_accueil => {}
        response.should redirect_to(texte_accueil_url(mock_texte_accueil))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved texte_accueil as @texte_accueil" do
        TexteAccueil.stub(:new).with({'these' => 'params'}).and_return(mock_texte_accueil(:save => false))
        post :create, :texte_accueil => {:these => 'params'}
        assigns[:texte_accueil].should equal(mock_texte_accueil)
      end

      it "re-renders the 'new' template" do
        TexteAccueil.stub(:new).and_return(mock_texte_accueil(:save => false))
        post :create, :texte_accueil => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested texte_accueil" do
        TexteAccueil.should_receive(:find).with("37").and_return(mock_texte_accueil)
        mock_texte_accueil.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :texte_accueil => {:these => 'params'}
      end

      it "assigns the requested texte_accueil as @texte_accueil" do
        TexteAccueil.stub(:find).and_return(mock_texte_accueil(:update_attributes => true))
        put :update, :id => "1"
        assigns[:texte_accueil].should equal(mock_texte_accueil)
      end

      it "redirects to the texte_accueil" do
        TexteAccueil.stub(:find).and_return(mock_texte_accueil(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(texte_accueil_url(mock_texte_accueil))
      end
    end

    describe "with invalid params" do
      it "updates the requested texte_accueil" do
        TexteAccueil.should_receive(:find).with("37").and_return(mock_texte_accueil)
        mock_texte_accueil.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :texte_accueil => {:these => 'params'}
      end

      it "assigns the texte_accueil as @texte_accueil" do
        TexteAccueil.stub(:find).and_return(mock_texte_accueil(:update_attributes => false))
        put :update, :id => "1"
        assigns[:texte_accueil].should equal(mock_texte_accueil)
      end

      it "re-renders the 'edit' template" do
        TexteAccueil.stub(:find).and_return(mock_texte_accueil(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested texte_accueil" do
      TexteAccueil.should_receive(:find).with("37").and_return(mock_texte_accueil)
      mock_texte_accueil.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the texte_accueils list" do
      TexteAccueil.stub(:find).and_return(mock_texte_accueil(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(texte_accueils_url)
    end
  end

end
