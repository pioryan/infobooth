require 'spec_helper'

FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir["spec/support/fixture_builder.rb"]

  # now declare objects
  fbuilder.factory do

    #Users
    admin_user = User.create!(:email => "admin@admin.com", :password => 'password', :first_name => 'admin', :last_name => 'admin')
    name(:admin, admin_user)
    simple_user = User.create!(:email => "simple@simple.com", :password => 'password', :first_name => 'simple', :last_name => 'user')
    name(:simple_user, simple_user)

    #Pages
    test_page = Page.create!(:title => "Test", :slug => "test", :active => false, :modifier => admin_user, :body => "Blah Blah")
    name(:test, test_page)

    #Roles
    admin_role = Role.create!(:name => 'Admin')
    name(:admin, admin_role)

    #UserRoles
    admin_user_role = UserRole.create!(:user  => admin_user, :role => admin_role)
    name(:admin, admin_user_role)
  end
end