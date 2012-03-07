require 'spec_helper'

describe 'layouts/application/_header.html.haml' do
	before do
		render
	end
	it "works" do
		rendered.should_not be_blank
	end
	it "contains logo tag" do
		rendered.should have_tag('header #logo')
	end
	it "contains menu tag" do
		rendered.should have_tag('menu')
	end
end
