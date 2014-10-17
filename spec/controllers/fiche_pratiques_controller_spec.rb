require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FichePratiquesController do

  # This should return the minimal set of attributes required to create a valid
  # FichePratique. As you add validations to FichePratique, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FichePratiquesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all fiche_pratiques as @fiche_pratiques" do
      fiche_pratique = FichePratique.create! valid_attributes
      get :index, {}, valid_session
      assigns(:fiche_pratiques).should eq([fiche_pratique])
    end
  end

  describe "GET show" do
    it "assigns the requested fiche_pratique as @fiche_pratique" do
      fiche_pratique = FichePratique.create! valid_attributes
      get :show, {:id => fiche_pratique.to_param}, valid_session
      assigns(:fiche_pratique).should eq(fiche_pratique)
    end
  end

  describe "GET new" do
    it "assigns a new fiche_pratique as @fiche_pratique" do
      get :new, {}, valid_session
      assigns(:fiche_pratique).should be_a_new(FichePratique)
    end
  end

  describe "GET edit" do
    it "assigns the requested fiche_pratique as @fiche_pratique" do
      fiche_pratique = FichePratique.create! valid_attributes
      get :edit, {:id => fiche_pratique.to_param}, valid_session
      assigns(:fiche_pratique).should eq(fiche_pratique)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FichePratique" do
        expect {
          post :create, {:fiche_pratique => valid_attributes}, valid_session
        }.to change(FichePratique, :count).by(1)
      end

      it "assigns a newly created fiche_pratique as @fiche_pratique" do
        post :create, {:fiche_pratique => valid_attributes}, valid_session
        assigns(:fiche_pratique).should be_a(FichePratique)
        assigns(:fiche_pratique).should be_persisted
      end

      it "redirects to the created fiche_pratique" do
        post :create, {:fiche_pratique => valid_attributes}, valid_session
        response.should redirect_to(FichePratique.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fiche_pratique as @fiche_pratique" do
        # Trigger the behavior that occurs when invalid params are submitted
        FichePratique.any_instance.stub(:save).and_return(false)
        post :create, {:fiche_pratique => { "title" => "invalid value" }}, valid_session
        assigns(:fiche_pratique).should be_a_new(FichePratique)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FichePratique.any_instance.stub(:save).and_return(false)
        post :create, {:fiche_pratique => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested fiche_pratique" do
        fiche_pratique = FichePratique.create! valid_attributes
        # Assuming there are no other fiche_pratiques in the database, this
        # specifies that the FichePratique created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FichePratique.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => fiche_pratique.to_param, :fiche_pratique => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested fiche_pratique as @fiche_pratique" do
        fiche_pratique = FichePratique.create! valid_attributes
        put :update, {:id => fiche_pratique.to_param, :fiche_pratique => valid_attributes}, valid_session
        assigns(:fiche_pratique).should eq(fiche_pratique)
      end

      it "redirects to the fiche_pratique" do
        fiche_pratique = FichePratique.create! valid_attributes
        put :update, {:id => fiche_pratique.to_param, :fiche_pratique => valid_attributes}, valid_session
        response.should redirect_to(fiche_pratique)
      end
    end

    describe "with invalid params" do
      it "assigns the fiche_pratique as @fiche_pratique" do
        fiche_pratique = FichePratique.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FichePratique.any_instance.stub(:save).and_return(false)
        put :update, {:id => fiche_pratique.to_param, :fiche_pratique => { "title" => "invalid value" }}, valid_session
        assigns(:fiche_pratique).should eq(fiche_pratique)
      end

      it "re-renders the 'edit' template" do
        fiche_pratique = FichePratique.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FichePratique.any_instance.stub(:save).and_return(false)
        put :update, {:id => fiche_pratique.to_param, :fiche_pratique => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested fiche_pratique" do
      fiche_pratique = FichePratique.create! valid_attributes
      expect {
        delete :destroy, {:id => fiche_pratique.to_param}, valid_session
      }.to change(FichePratique, :count).by(-1)
    end

    it "redirects to the fiche_pratiques list" do
      fiche_pratique = FichePratique.create! valid_attributes
      delete :destroy, {:id => fiche_pratique.to_param}, valid_session
      response.should redirect_to(fiche_pratiques_url)
    end
  end

end
