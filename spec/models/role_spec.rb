require 'spec_helper'

describe Role do
  describe "validations" do
    it { validates_presence_of(:name) }

    it { validates_uniqueness_of(:name) }
  end

  it "works" do
    expect {
      Role.create!(:name => 'csr')
    }.to change(Role, :count).by(1)
  end

  describe "#method_missing" do
    context "valid" do
      it "should return the corresponding name" do
        Role.admin.should == roles(:admin)
      end
    end

    context "invalid" do
      it "should raise exception" do
        lambda{
          Role.test
        }.should raise_exception(Exception::NoMethodError)
      end
    end
  end

end