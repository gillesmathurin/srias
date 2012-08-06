# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do
  describe "annonces_courantes" do
    before(:each) do
          
    end    
    
    it "assigns the annonces the user can see as @annonces_courantes" do
      pending()
      helper.annonces_courantes.should == [mock_annonce]
    end
  end

  describe "missing_annonce_image(annonce)" do
    before(:each) do
      @without_image_annonce = FactoryGirl.create(:annonce_without_image)
      @with_image_annonce = FactoryGirl.create(:annonce)
    end

    it "checks wether the annonce has got an image or not" do
      helper.missing_annonce_image(@with_image_annonce).should be_false
      helper.missing_annonce_image(@without_image_annonce).should be_true
    end
  end

  describe "missing_action_illustration(manifestation)" do
    before(:each) do
      @manifestation_with_illustration = FactoryGirl.create(:manifestation_with_illustration)
      @manifestation_without_illustration = FactoryGirl.create(:manifestation_without_illustration)
    end

    it "checks wether the action (manifestation) has got an illustration or not" do
      helper.missing_action_illustration(@manifestation_with_illustration).should be_false
      helper.missing_action_illustration(@manifestation_without_illustration).should be_true
    end
  end

  describe "display_link_or_image(fichier)" do
    context "fichier has got an image file attachment" do
      before(:each) do
        @fichier_with_imagefile = FactoryGirl.create(:fichier_with_imagefile)
      end

      it "returns an image link" do
        helper.display_link_or_image(@fichier_with_imagefile).should eql(image_tag(@fichier_with_imagefile.fichier.url(nil, false), :width => "585"))
      end
    end

    context "fichier has got a file attachment different than an image" do
      before(:each) do
        @fichier_with_file = FactoryGirl.create(:fichier_with_file)
      end

      it "returns a link to download the attachment" do
        helper.display_link_or_image(@fichier_with_file).should eql(link_to("Téléchargez : #{@fichier_with_file.fichier.original_filename}", @fichier_with_file.fichier.url(nil, false)))
      end
    end

    context "fichier hasn't got a file attachment" do
      before(:each) do
        @fichier_without_attachment = FactoryGirl.create(:fichier)
      end

      it "returns nil" do
        helper.display_link_or_image(@fichier_without_attachment).should be_nil
      end
    end
  end
end