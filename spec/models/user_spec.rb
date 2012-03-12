require 'spec_helper'

describe User do

  before do
    @admin = users(:admin)
    @juan = users(:simple_user)
  end

  describe "admin?" do

    context "has admin role"  do
      it "should return true" do
        @admin.should be_admin
      end
    end

    context "has no admin role"  do
      it "should return false" do
        @juan.should_not be_admin
      end
    end
  end

  describe "#add_role" do
    it "should create a role for user" do
      @juan.user_roles.create!(:role => roles(:admin))
      @juan.roles.should include(roles(:admin))
    end

  end

end