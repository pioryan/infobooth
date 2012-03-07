require 'spec_helper'

describe 'layouts/application/_sub_header.html.haml' do
	before do
		render
	end

	it "works" do
		rendered.should_not be_blank
	end

	it "contains login tag" do
		rendered.should have_tag('#login')
	end
	
	it "contains sub_menu tag" do
		rendered.should have_tag('submenu')
	end

	it "contains sub_menu li a tag" do
		rendered.should have_tag('ul li a', :text => 'Software')
		rendered.should have_tag('ul li a', :text => 'Web')
	end
	

end
