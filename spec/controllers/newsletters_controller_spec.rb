require 'spec_helper'

describe NewslettersController do

  def mock_newsletter(stubs={})
    @mock_newsletter ||= mock_model(Newsletter, stubs)
  end

  describe "GET index" do
    it "assigns all newsletters as @newsletters" do
      Newsletter.stub(:find).with(:all).and_return([mock_newsletter])
      get :index
      assigns[:newsletters].should == [mock_newsletter]
    end
  end

  describe "GET show" do
    it "assigns the requested newsletter as @newsletter" do
      Newsletter.stub(:find).with("37").and_return(mock_newsletter)
      get :show, :id => "37"
      assigns[:newsletter].should equal(mock_newsletter)
    end
  end

  describe "GET new" do
    it "assigns a new newsletter as @newsletter" do
      Newsletter.stub(:new).and_return(mock_newsletter)
      get :new
      assigns[:newsletter].should equal(mock_newsletter)
    end
  end

  describe "GET edit" do
    it "assigns the requested newsletter as @newsletter" do
      Newsletter.stub(:find).with("37").and_return(mock_newsletter)
      get :edit, :id => "37"
      assigns[:newsletter].should equal(mock_newsletter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created newsletter as @newsletter" do
        Newsletter.stub(:new).with({'these' => 'params'}).and_return(mock_newsletter(:save => true))
        post :create, :newsletter => {:these => 'params'}
        assigns[:newsletter].should equal(mock_newsletter)
      end

      it "redirects to the created newsletter" do
        Newsletter.stub(:new).and_return(mock_newsletter(:save => true))
        post :create, :newsletter => {}
        response.should redirect_to(newsletter_url(mock_newsletter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved newsletter as @newsletter" do
        Newsletter.stub(:new).with({'these' => 'params'}).and_return(mock_newsletter(:save => false))
        post :create, :newsletter => {:these => 'params'}
        assigns[:newsletter].should equal(mock_newsletter)
      end

      it "re-renders the 'new' template" do
        Newsletter.stub(:new).and_return(mock_newsletter(:save => false))
        post :create, :newsletter => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested newsletter" do
        Newsletter.should_receive(:find).with("37").and_return(mock_newsletter)
        mock_newsletter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :newsletter => {:these => 'params'}
      end

      it "assigns the requested newsletter as @newsletter" do
        Newsletter.stub(:find).and_return(mock_newsletter(:update_attributes => true))
        put :update, :id => "1"
        assigns[:newsletter].should equal(mock_newsletter)
      end

      it "redirects to the newsletter" do
        Newsletter.stub(:find).and_return(mock_newsletter(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(newsletter_url(mock_newsletter))
      end
    end

    describe "with invalid params" do
      it "updates the requested newsletter" do
        Newsletter.should_receive(:find).with("37").and_return(mock_newsletter)
        mock_newsletter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :newsletter => {:these => 'params'}
      end

      it "assigns the newsletter as @newsletter" do
        Newsletter.stub(:find).and_return(mock_newsletter(:update_attributes => false))
        put :update, :id => "1"
        assigns[:newsletter].should equal(mock_newsletter)
      end

      it "re-renders the 'edit' template" do
        Newsletter.stub(:find).and_return(mock_newsletter(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested newsletter" do
      Newsletter.should_receive(:find).with("37").and_return(mock_newsletter)
      mock_newsletter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the newsletters list" do
      Newsletter.stub(:find).and_return(mock_newsletter(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(newsletters_url)
    end
  end

end
