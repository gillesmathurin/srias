require 'spec_helper'

describe ManifestationsController do
  fixtures :users
  
  def mock_user
    @user ||= users(:ben)
  end
  
  def user_logged_in
    activate_authlogic
    UserSession.create(mock_user)
  end

  def mock_manifestation(stubs={})
    @mock_manifestation ||= mock_model(Manifestation, stubs)
  end

  describe "GET index" do
    it "assigns all manifestations as @manifestations" do
      Manifestation.stub(:find).with(:all).and_return([mock_manifestation])
      get :index
      assigns[:manifestations].should == [mock_manifestation]
    end
  end

  describe "GET show" do
    it "assigns the requested manifestation as @manifestation" do
      Manifestation.stub(:find).with("37").and_return(mock_manifestation)
      get :show, :id => "37"
      assigns[:manifestation].should equal(mock_manifestation)
    end
  end

  describe "GET new" do
    context "with a logged_in user" do
      before(:each) do
        user_logged_in
      end
      
      it "assigns a new manifestation as @manifestation" do
        Manifestation.stub(:new).and_return(mock_manifestation)
        get :new
        assigns[:manifestation].should equal(mock_manifestation)
      end
    end

  end

  describe "GET edit" do
    context "with a logged_in user" do
      before(:each) do
        user_logged_in
      end
      
      it "assigns the requested manifestation as @manifestation" do
        Manifestation.stub(:find).with("37").and_return(mock_manifestation)
        get :edit, :id => "37"
        assigns[:manifestation].should equal(mock_manifestation)
      end
    end
  end

  describe "POST create" do
    
    context "with a logged_in user" do
      before(:each) do
        user_logged_in
      end
      
      describe "with valid params" do
        it "assigns a newly created manifestation as @manifestation" do
          Manifestation.stub(:new).with({'these' => 'params'}).and_return(mock_manifestation(:save => true))
          post :create, :manifestation => {:these => 'params'}
          assigns[:manifestation].should equal(mock_manifestation)
        end

        it "redirects to the created manifestation" do
          Manifestation.stub(:new).and_return(mock_manifestation(:save => true))
          post :create, :manifestation => {}
          response.should redirect_to(manifestation_url(mock_manifestation))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved manifestation as @manifestation" do
          Manifestation.stub(:new).with({'these' => 'params'}).and_return(mock_manifestation(:save => false))
          post :create, :manifestation => {:these => 'params'}
          assigns[:manifestation].should equal(mock_manifestation)
        end

        it "re-renders the 'new' template" do
          Manifestation.stub(:new).and_return(mock_manifestation(:save => false))
          post :create, :manifestation => {}
          response.should render_template('new')
        end
      end
    end



  end

  describe "PUT update" do
    
    context "with a logged_in user" do
      before(:each) do
        user_logged_in
      end
      
      describe "with valid params" do
        it "updates the requested manifestation" do
          Manifestation.should_receive(:find).with("37").and_return(mock_manifestation)
          mock_manifestation.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :manifestation => {:these => 'params'}
        end

        it "assigns the requested manifestation as @manifestation" do
          Manifestation.stub(:find).and_return(mock_manifestation(:update_attributes => true))
          put :update, :id => "1"
          assigns[:manifestation].should equal(mock_manifestation)
        end

        it "redirects to the manifestation" do
          Manifestation.stub(:find).and_return(mock_manifestation(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(manifestation_url(mock_manifestation))
        end
      end

      describe "with invalid params" do
        it "updates the requested manifestation" do
          Manifestation.should_receive(:find).with("37").and_return(mock_manifestation)
          mock_manifestation.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :manifestation => {:these => 'params'}
        end

        it "assigns the manifestation as @manifestation" do
          Manifestation.stub(:find).and_return(mock_manifestation(:update_attributes => false))
          put :update, :id => "1"
          assigns[:manifestation].should equal(mock_manifestation)
        end

        it "re-renders the 'edit' template" do
          Manifestation.stub(:find).and_return(mock_manifestation(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      user_logged_in
    end
    
    it "destroys the requested manifestation" do
      Manifestation.should_receive(:find).with("37").and_return(mock_manifestation)
      mock_manifestation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the manifestations list" do
      Manifestation.stub(:find).and_return(mock_manifestation(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(manifestations_url)
    end
  end

end
