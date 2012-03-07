require 'spec_helper'

describe ApplicationHelper do

	before do
		helper.extend Haml
    helper.extend Haml::Helpers 
    helper.send :init_haml_helpers
	end

	describe "menu_tag" do
		it "contains home" do
			get_html.should have_tag('ul.menu_list li a', :text => 'Home')
		end

		it "contains about us" do
			get_html.should have_tag('ul.menu_list li a', :text => 'About Us')
		end
	
		it "contains home" do
			get_html.should have_tag('ul.menu_list li a', :text => 'Contact Us')
		end
	end

	def get_html
  	result_of { helper.menu_tag(:menu, %w[home about contact]) }
  end

	def result_of(&proc)
    helper.capture_haml(&proc)
  end

end
