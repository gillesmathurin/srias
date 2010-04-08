require 'spec_helper'

describe MissionsController do
  fixtures :users
  
  def mock_mission(stubs={})
    @mock_mission ||= mock_model(Mission, stubs)
  end
  
  def mock_user
    @user ||= users(:ben)
  end
  
  def user_logged_in
    activate_authlogic
    UserSession.create(mock_user)
  end
  
  describe "GET index" do
    it "assigns all missions as @missions" do
      Mission.stub(:find).with(:all).and_return([mock_mission])
      get :index
      assigns[:missions].should == [mock_mission]
    end
  end

  describe "GET show" do
    it "assigns the requested mission as @mission" do
      Mission.stub(:find).with("37").and_return(mock_mission)
      get :show, :id => "37"
      assigns[:mission].should equal(mock_mission)
    end
  end

  describe "GET new" do
    
    context "with a user logged_in" do
      before(:each) do
        user_logged_in
      end
      
      it "assigns a new mission as @mission" do
        Mission.stub(:new).and_return(mock_mission)
        get :new
        assigns[:mission].should equal(mock_mission)
      end
    end
    
    context "without a logged_in user" do
      it "doesn't assigns a new mission as @mission" do
        Mission.should_not_receive(:new)        
        get :new
      end
    end
  end

  describe "GET edit" do
    
    context "with a logged_in user" do
      before(:each) do
        user_logged_in
      end
      
      it "assigns the requested mission as @mission" do
        Mission.stub(:find).with("37").and_return(mock_mission)
        get :edit, :id => "37"
        assigns[:mission].should equal(mock_mission)
      end
    end
    
    context "without a logged_in user" do
      it "doesn't assigns the requested mission as @mission" do
        Mission.should_not_receive(:find).with("37")
        get :edit, :id => "37"        
      end
    end   

  end

  describe "POST create" do
    
    context "with a logged_in user" do
      before(:each) do
        user_logged_in
      end
      
      describe "with valid params" do
        it "assigns a newly created mission as @mission" do
          Mission.stub(:new).with({'these' => 'params'}).and_return(mock_mission(:save => true))
          post :create, :mission => {:these => 'params'}
          assigns[:mission].should equal(mock_mission)
        end

        it "redirects to the created mission" do
          Mission.stub(:new).and_return(mock_mission(:save => true))
          post :create, :mission => {}
          response.should redirect_to(mission_url(mock_mission))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved mission as @mission" do
          Mission.stub(:new).with({'these' => 'params'}).and_return(mock_mission(:save => false))
          post :create, :mission => {:these => 'params'}
          assigns[:mission].should equal(mock_mission)
        end

        it "re-renders the 'new' template" do
          Mission.stub(:new).and_return(mock_mission(:save => false))
          post :create, :mission => {}
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
        it "updates the requested mission" do
          Mission.should_receive(:find).with("37").and_return(mock_mission)
          mock_mission.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :mission => {:these => 'params'}
        end

        it "assigns the requested mission as @mission" do
          Mission.stub(:find).and_return(mock_mission(:update_attributes => true))
          put :update, :id => "1"
          assigns[:mission].should equal(mock_mission)
        end

        it "redirects to the mission" do
          Mission.stub(:find).and_return(mock_mission(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(mission_url(mock_mission))
        end
      end

      describe "with invalid params" do
        it "updates the requested mission" do
          Mission.should_receive(:find).with("37").and_return(mock_mission)
          mock_mission.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :mission => {:these => 'params'}
        end

        it "assigns the mission as @mission" do
          Mission.stub(:find).and_return(mock_mission(:update_attributes => false))
          put :update, :id => "1"
          assigns[:mission].should equal(mock_mission)
        end

        it "re-renders the 'edit' template" do
          Mission.stub(:find).and_return(mock_mission(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end
    end
    
  end

  describe "DELETE destroy" do
    context "with a logged_in" do
      before(:each) do
        user_logged_in
      end
      
      it "destroys the requested mission" do
        Mission.should_receive(:find).with("37").and_return(mock_mission)
        mock_mission.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the missions list" do
        Mission.stub(:find).and_return(mock_mission(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(missions_url)
      end
    end

  end

end
