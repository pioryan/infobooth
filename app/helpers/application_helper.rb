module ApplicationHelper
	def menu_tag(tag = :tag, menus = [], options = {:class => :menu_list })
		haml_tag(tag) do
			haml_tag(:ul, :class => options[:class]) do
				menus.each do |menu|
					haml_tag(:li) do
						haml_concat(link_to(t(:"pages.#{menu}"), "/#{menu}"))
					end
				end
			end
		end
	end
end
