require 'spec_helper'

describe ApplicationHelper do

	before do
		helper.extend Haml
    helper.extend Haml::Helpers 
    helper.send :init_haml_helpers
	end

	describe "menu_tag" do
		it "contains home" do
			get_html.should have_tag('ul.menu_list li a', :text => 'Home', :href => '/home')
      get_html_array.should have_tag('ul.menu_list li a', :text => 'Home', :href => '/home')
		end

		it "contains about us" do
			get_html.should have_tag('ul.menu_list li a', :text => 'About Us', :href => '/about')
      get_html_array.should have_tag('ul.menu_list li a', :text => 'About Us', :href => '/about')
		end

		it "contains contact" do
			get_html.should have_tag('ul.menu_list li a', :text => 'Contact Us', :href => '/contact_us')
      get_html_array.should have_tag('ul.menu_list li a', :text => 'Contact Us', :href => '/contact')
		end
	end

	def get_html
		result_of { helper.menu_tag(:menu, {:home => :home, :about => :about, :contact => :contact_us} ) }
  end

  def get_html_array
		result_of { helper.menu_tag(:menu, %w( home about contact )) }
  end

	def result_of(&proc)
    helper.capture_haml(&proc)
  end

end
