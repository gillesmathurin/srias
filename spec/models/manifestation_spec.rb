# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Manifestation do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :lieu => "value for lieu",
      :date_debut => Time.now,
      :date_fin => Time.now,
      :description => "value for description",
      :mission_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Manifestation.create!(@valid_attributes)
  end

  describe "to_come()" do
    before(:each) do
      @future_manif = FactoryGirl.create(:future_manif)
      @notended_manif = FactoryGirl.create(:notended_manif)
      @past_manif = FactoryGirl.create(:past_manif)
    end

    it "finds valid manifestions which are either not started or not ended" do
      Manifestation.to_come.all.should have(2).records
      Manifestation.to_come.all.should include(@future_manif) 
      Manifestation.to_come.all.should include(@notended_manif)
    end

    it "doesn't find past events" do
      Manifestation.to_come.all.should_not include(@past_manif) 
    end
  end

  describe "past" do
    before(:each) do
      @future_manif = FactoryGirl.create(:future_manif)
      @notended_manif = FactoryGirl.create(:notended_manif)
      @past_manif = FactoryGirl.create(:past_manif)
    end

    it "finds past and validated manifestations" do
      Manifestation.past.all.should include(@past_manif)
      Manifestation.past.all.should_not include(@future_manif)
      Manifestation.past.all.should_not include(@notended_manif)
    end
  end

  describe "pending" do
    it "finds not validated manifestation" do
      @future_manif = FactoryGirl.create(:future_manif, :validate => false)
      Manifestation.pending.all.should include(@future_manif)
    end
  end

  describe "as_valid_annonces" do
    it "finds all the manifestation tagged as being annonces" do
      manif = FactoryGirl.create(:manifestation, :as_annonce => true)
      manif2 = FactoryGirl.create(:manifestation)
      Manifestation.as_valid_annonces.should have(1).record
    end
  end

  describe "to_param" do
    before(:each) do
      @manif = FactoryGirl.create(:manifestation)
    end
    
    it "returns a human readable id" do
      result = @manif.to_param
      result.should eql("#{@manif.id}-manifestation")
    end
  end

  describe "self.group_by_year(params_page)" do
    before(:each) do
      @yearago_manifs = FactoryGirl.create_list(:manifestation, 5, :date_debut => 1.year.ago,
       :date_fin => 1.year.ago + 5.days)
      @this_year_manifs = FactoryGirl.create_list(:manifestation,5)
    end

    it "groups the manifestations by year" do
      result = Manifestation.group_by_year("1")
      puts result.inspect
    end
  end
end
