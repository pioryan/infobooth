require 'spec_helper'

FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir["spec/support/fixture_builder.rb"]

  # now declare objects
  fbuilder.factory do
    admin = User.create!(:email => "admin@admin.com", :password => 'password', :first_name => 'admin', :last_name => 'admin')
    name(:admin, admin)
    test = Page.create!(:title => "Test", :slug => "test", :active => false, :creator => admin, :modifier => admin, :body => "Blah Blah")
    name(:test, test)
  end
end