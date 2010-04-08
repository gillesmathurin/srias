require 'spec_helper'

describe LiensController do

  def mock_lien(stubs={})
    @mock_lien ||= mock_model(Lien, stubs)
  end

  describe "GET index" do
    it "assigns all liens as @liens" do
      Lien.stub(:find).with(:all).and_return([mock_lien])
      get :index
      assigns[:liens].should == [mock_lien]
    end
  end

  describe "GET show" do
    it "assigns the requested lien as @lien" do
      Lien.stub(:find).with("37").and_return(mock_lien)
      get :show, :id => "37"
      assigns[:lien].should equal(mock_lien)
    end
  end

  describe "GET new" do
    it "assigns a new lien as @lien" do
      Lien.stub(:new).and_return(mock_lien)
      get :new
      assigns[:lien].should equal(mock_lien)
    end
  end

  describe "GET edit" do
    it "assigns the requested lien as @lien" do
      Lien.stub(:find).with("37").and_return(mock_lien)
      get :edit, :id => "37"
      assigns[:lien].should equal(mock_lien)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created lien as @lien" do
        Lien.stub(:new).with({'these' => 'params'}).and_return(mock_lien(:save => true))
        post :create, :lien => {:these => 'params'}
        assigns[:lien].should equal(mock_lien)
      end

      it "redirects to the created lien" do
        Lien.stub(:new).and_return(mock_lien(:save => true))
        post :create, :lien => {}
        response.should redirect_to(lien_url(mock_lien))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lien as @lien" do
        Lien.stub(:new).with({'these' => 'params'}).and_return(mock_lien(:save => false))
        post :create, :lien => {:these => 'params'}
        assigns[:lien].should equal(mock_lien)
      end

      it "re-renders the 'new' template" do
        Lien.stub(:new).and_return(mock_lien(:save => false))
        post :create, :lien => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested lien" do
        Lien.should_receive(:find).with("37").and_return(mock_lien)
        mock_lien.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lien => {:these => 'params'}
      end

      it "assigns the requested lien as @lien" do
        Lien.stub(:find).and_return(mock_lien(:update_attributes => true))
        put :update, :id => "1"
        assigns[:lien].should equal(mock_lien)
      end

      it "redirects to the lien" do
        Lien.stub(:find).and_return(mock_lien(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(lien_url(mock_lien))
      end
    end

    describe "with invalid params" do
      it "updates the requested lien" do
        Lien.should_receive(:find).with("37").and_return(mock_lien)
        mock_lien.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lien => {:these => 'params'}
      end

      it "assigns the lien as @lien" do
        Lien.stub(:find).and_return(mock_lien(:update_attributes => false))
        put :update, :id => "1"
        assigns[:lien].should equal(mock_lien)
      end

      it "re-renders the 'edit' template" do
        Lien.stub(:find).and_return(mock_lien(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested lien" do
      Lien.should_receive(:find).with("37").and_return(mock_lien)
      mock_lien.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the liens list" do
      Lien.stub(:find).and_return(mock_lien(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(liens_url)
    end
  end

end
