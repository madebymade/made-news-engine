require 'spec_helper'

module News
  describe Item do
    before(:each) do
      @news_item = FactoryGirl.create(:item)
    end 

    it "has a valid factory" do
      @news_item.should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:item, title: nil).should_not be_valid
    end

    it "is invalid without copy in the text area" do
      FactoryGirl.build(:item, text: nil).should_not be_valid
    end

    it "is invalid without a lead image" do
      FactoryGirl.build(:item, lead_image_file_name: nil).should_not be_valid
    end

    it "can't create a related link without a title" do
      FactoryGirl.build(:related_link, title: nil).should_not be_valid
    end

    it "can't create a related link without a title" do
      FactoryGirl.build(:related_link, text: nil).should_not be_valid
    end

    it "can't create a related link without a url" do
      FactoryGirl.build(:related_link, url: nil).should_not be_valid
    end

    it "can't create a related link without an image" do
      FactoryGirl.build(:related_link, image_file_name: nil).should_not be_valid
    end
  end
end