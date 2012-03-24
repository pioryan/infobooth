require 'spec_helper'


describe Page do
  describe "validations" do

    it {  validates_presence_of(:title)  }

    it {  validates_presence_of(:slug)  }

    it {  validates_uniqueness_of(:slug)  }

    it {  validates_uniqueness_of(:title)  }

  end

  describe "#create_page" do
    before do
      @user = users(:admin)
      Page.current_actor = @user
    end
    it "should create page" do
      expect{
        Page.create!(:title => 'test2', :slug => 'testme', :body => 'Blah Blah')
      }.to change(Page, :count).by(1)
    end

    it "should have a creator" do
      page = Page.create!(:title => 'test2', :slug => 'testme', :body => 'Blah Blah')
      @user.id.should == page.created_by
    end

  end

end