require 'spec_helper'

describe UserRole do

  before  do
    @admin = users(:admin)
    @admin_role = roles(:admin)
    @juan = users(:simple_user)
  end

  describe "validations" do
    it {validates_presence_of(:user_id)}

    it {validates_presence_of(:role_id)}

  end

  it "works" do
    expect{
      UserRole.create!(:user_id => @juan.id, :role_id  => @admin_role.id)
    }.to change(UserRole, :count).by(1)
  end

  describe "associations" do
    context "belongs_to" do
      it "should retrieve user " do
        user_role = UserRole.create!(:user => @juan, :role  => @admin_role)
        user_role.user.should  == @juan
      end

      it "should retrieve role" do
        user_role = UserRole.create!(:user => @juan, :role  => @admin_role)
        user_role.role.should  == @admin_role
      end

    end
  end

end