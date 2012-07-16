# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PartenairesController do
  fixtures :users
  
  def mock_user
    @user ||= users(:ben)
  end
  
  def user_logged_in
    activate_authlogic
    UserSession.create(mock_user)
  end

  def mock_partenaire(stubs={})
    @mock_partenaire ||= mock_model(Partenaire, stubs)
  end

  describe "GET index" do    
    it "assigns all partenaires as @partenaires" do
      Partenaire.stub(:find).with(:all).and_return([mock_partenaire])
      mock_partenaire.stub(:category_id)
      get :index
      # assigns[:partenaires].should == [mock_partenaire] # TODO : find how to simulate an OrderedHash
    end
  end

  describe "GET show" do
    it "assigns the requested partenaire as @partenaire" do
      Partenaire.stub(:find).with("37").and_return(mock_partenaire)
      get :show, :id => "37"
      assigns[:partenaire].should equal(mock_partenaire)
    end
  end

  describe "GET new" do
    before(:each) do
      user_logged_in
    end
    it "assigns a new partenaire as @partenaire" do
      Partenaire.stub(:new).and_return(mock_partenaire)
      get :new
      assigns[:partenaire].should equal(mock_partenaire)
    end
  end

  describe "GET edit" do
    before(:each) do
      user_logged_in
    end
    it "assigns the requested partenaire as @partenaire" do
      Partenaire.stub(:find).with("37").and_return(mock_partenaire)
      get :edit, :id => "37"
      assigns[:partenaire].should equal(mock_partenaire)
    end
  end

  describe "POST create" do
    before(:each) do
      user_logged_in
    end
    describe "with valid params" do
      it "assigns a newly created partenaire as @partenaire" do
        Partenaire.stub(:new).with({'these' => 'params'}).and_return(mock_partenaire(:save => true))
        post :create, :partenaire => {:these => 'params'}
        assigns[:partenaire].should equal(mock_partenaire)
      end

      it "redirects to the created partenaire" do
        Partenaire.stub(:new).and_return(mock_partenaire(:save => true))
        post :create, :partenaire => {}
        response.should redirect_to(partenaire_url(mock_partenaire))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved partenaire as @partenaire" do
        Partenaire.stub(:new).with({'these' => 'params'}).and_return(mock_partenaire(:save => false))
        post :create, :partenaire => {:these => 'params'}
        assigns[:partenaire].should equal(mock_partenaire)
      end

      it "re-renders the 'new' template" do
        Partenaire.stub(:new).and_return(mock_partenaire(:save => false))
        post :create, :partenaire => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do
    before(:each) do
      user_logged_in
    end
    describe "with valid params" do
      it "updates the requested partenaire" do
        Partenaire.should_receive(:find).with("37").and_return(mock_partenaire)
        mock_partenaire.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :partenaire => {:these => 'params'}
      end

      it "assigns the requested partenaire as @partenaire" do
        Partenaire.stub(:find).and_return(mock_partenaire(:update_attributes => true))
        put :update, :id => "1"
        assigns[:partenaire].should equal(mock_partenaire)
      end

      it "redirects to the partenaire" do
        Partenaire.stub(:find).and_return(mock_partenaire(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(partenaire_url(mock_partenaire))
      end
    end

    describe "with invalid params" do
      it "updates the requested partenaire" do
        Partenaire.should_receive(:find).with("37").and_return(mock_partenaire)
        mock_partenaire.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :partenaire => {:these => 'params'}
      end

      it "assigns the partenaire as @partenaire" do
        Partenaire.stub(:find).and_return(mock_partenaire(:update_attributes => false))
        put :update, :id => "1"
        assigns[:partenaire].should equal(mock_partenaire)
      end

      it "re-renders the 'edit' template" do
        Partenaire.stub(:find).and_return(mock_partenaire(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    before(:each) do
      user_logged_in
    end
    it "destroys the requested partenaire" do
      Partenaire.should_receive(:find).with("37").and_return(mock_partenaire)
      mock_partenaire.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the partenaires list" do
      Partenaire.stub(:find).and_return(mock_partenaire(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(partenaires_url)
    end
  end

end
