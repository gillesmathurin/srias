# -*- encoding : utf-8 -*-
require 'spec_helper'

describe FichiersController do

  def mock_manifestation(stubs={})
    @manifestation ||= mock_model(Manifestation, stubs)
  end

  def mock_fichier(stubs={})
    @fichier ||= mock_model(Fichier, stubs)
  end

  def mock_offre(stubs={})
    @offre ||= mock_model(Offre, stubs)
  end

  #Delete these examples and add some real ones
  it "should use FichiersController" do
    controller.should be_an_instance_of(FichiersController)
  end


  describe "GET 'index'" do
    context "for a manifestation" do
      it "assigns the manifestation's fichiers as @fichiers" do
        Manifestation.should_receive(:find).with("12").and_return(mock_manifestation)
        mock_manifestation.should_receive(:fichiers).and_return([mock_fichier])
        get :index, :manifestation_id => "12"
        assigns(:fichiers).should == [mock_fichier]
      end
    end

    context "for an offre" do
      it "assigns the offre's fichiers as @fichiers" do
        Offre.should_receive(:find).with("12").and_return(mock_offre)
        mock_offre.should_receive(:fichiers).and_return([mock_fichier])
        get :index, :offre_id => "12"
        assigns(:fichiers).should == [mock_fichier]
      end      
    end
  end

  describe "GET 'show'" do
    context "a manifestation's fichier" do
      it "assigns the manifestation's fichier as @fichier" do
        Manifestation.should_receive(:find).with("12").and_return(mock_manifestation)
        mock_manifestation.stub_chain(:fichiers, :find).and_return(mock_fichier)
        get :show, :id => "37", :manifestation_id => "12"
        assigns(:fichier).should == mock_fichier
      end
    end

    context "a offre's fichier" do
      it "assigns the offre's fichier as @fichier" do
        Offre.should_receive(:find).with("12").and_return(mock_offre)
        mock_offre.stub_chain(:fichiers, :find).and_return(mock_fichier)
        get :show, :id => "37", :offre_id => "12"
        assigns(:fichier).should == mock_fichier
      end
    end
  end

  describe "GET 'new'" do
    context "for a manifestation" do
      it "assigns a new manifestation's fichier as @fichier" do
        Manifestation.should_receive(:find).with("12").and_return(mock_manifestation)
        mock_manifestation.stub_chain(:fichiers, :build).and_return(mock_fichier)
        get :new, :manifestation_id => "12"
        assigns(:fichier).should == mock_fichier
      end
    end

    context "for a offre" do
      it "assigns a new offre's fichier as @fichier" do
        Offre.should_receive(:find).with("12").and_return(mock_offre)
        mock_offre.stub_chain(:fichiers, :build).and_return(mock_fichier)
        get :new, :offre_id => "12"
        assigns(:fichier).should == mock_fichier
      end
    end
  end

  describe "GET 'edit'" do
    context "for a manifestation" do
      it "assigns  the requested manifestation's fichier as @fichier" do
        Manifestation.should_receive(:find).with("12").and_return(mock_manifestation)
        mock_manifestation.stub_chain(:fichiers, :find).and_return(mock_fichier)
        get :edit, :manifestation_id => "12", :id => "37"
        assigns(:fichier).should == mock_fichier
      end
    end

    context "for a offre" do
      it "assigns the requested offre's fichier as @fichier" do
        Offre.should_receive(:find).with("12").and_return(mock_offre)
        mock_offre.stub_chain(:fichiers, :find).and_return(mock_fichier)
        get :edit, :offre_id => "12", :id => "37"
        assigns(:fichier).should == mock_fichier
      end
    end
  end

  describe "DELETE destroy" do
    context "a manifestation's fichier" do
      it "destroy the requested fichier" do
        Manifestation.should_receive(:find).with("12").and_return(mock_manifestation)
        mock_manifestation.stub_chain(:fichiers, :find).and_return(mock_fichier)
        mock_fichier.should_receive(:destroy)
        delete :destroy, :manifestation_id => "12", :id => "37"
      end

      it "redirect to the manifestation views" do
        Manifestation.should_receive(:find).with("12").and_return(mock_manifestation)
        mock_manifestation.stub_chain(:fichiers, :find).and_return(mock_fichier(:destroy => true))
        delete :destroy, :manifestation_id => "12", :id => "37"
        response.should redirect_to(manifestation_url(mock_manifestation))
      end
    end

    context "a offre's fichier" do
      it "destroy the requested offre" do
        Offre.should_receive(:find).with("12").and_return(mock_offre)
        mock_offre.stub_chain(:fichiers, :find).and_return(mock_fichier)
        mock_fichier.should_receive(:destroy)
        delete :destroy, :offre_id => "12", :id => "37"
      end

      it "redirect to the manifestation views" do
        Offre.should_receive(:find).with("12").and_return(mock_offre)
        mock_offre.stub_chain(:fichiers, :find).and_return(mock_fichier(:destroy => true))
        delete :destroy, :offre_id => "12", :id => "37"
        response.should redirect_to(offre_url(mock_offre))
      end
    end
  end

  describe "POST create" do
    it "has to be written"
  end

  describe "PUT update" do
    it "has to be written"
  end
end
