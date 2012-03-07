class ApplicationController < ActionController::Base
  protect_from_forgery
	helper_method :controller_namespace, :namespaced_controller_name
	
	def controller_namespace
    self.class.controller_namespace
  end

  def namespaced_controller_name
    self.class.namespaced_controller_name
  end

	def self.controller_namespace
    @controller_namespace ||= controller_name == namespaced_controller_name ? nil : namespaced_controller_name.sub(/\.#{controller_name}$/, '')
  end

  def self.namespaced_controller_name
    @namespaced_controller_name ||= name.sub(/Controller$/, '').underscore.gsub(/\//, '.')
  end

  def namespaced_controller_action
    "#{namespaced_controller_name}.#{params[:action].to_s}"
  end
end
