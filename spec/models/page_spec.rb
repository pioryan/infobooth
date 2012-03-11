require 'spec_helper'


describe Page do
  describe "validations" do

    it {  validates_presence_of(:created_by) }

    it {  validates_presence_of(:modified_by)  }

    it {  validates_presence_of(:title)  }

    it {  validates_presence_of(:slug)  }

    it {  validates_uniqueness_of(:slug)  }

    it {  validates_uniqueness_of(:title)  }

  end

  describe "#create_page" do
    before do
      @user = users(:admin)
    end
    it "should create page" do
      expect{
        @user.pages.create!(:title => 'test2', :slug => 'testme', :body => 'Blah Blah')
      }.to change(Page, :count).by(1)
    end
  end

end