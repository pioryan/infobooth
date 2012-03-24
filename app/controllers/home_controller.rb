class HomeController < ApplicationController
	def index
		Rails.logger.error ">>>#{@current_actor.inspect}"
	end
end
