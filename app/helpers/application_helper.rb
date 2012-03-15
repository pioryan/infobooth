module ApplicationHelper
	def menu_tag(tag = :tag, menus = {}, options = {:class => :menu_list })
    menus = menus.to_hash_keys if menus.is_a?(Array)
		haml_tag(tag) do
			haml_tag(:ul, :class => options[:class]) do
				menus.each_pair do |menu, slug|
					haml_tag(:li, :id => menu) do
						haml_concat(link_to(t(:"pages.#{menu}"), "/#{slug}"))
					end
				end
			end
		end
	end
end
