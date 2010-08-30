class ApplicationController < ActionController::Base
  include TinyCore::Controllers::Application

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_visitor
  
protected
  def current_visitor
    Visitor.find_by_cookie_id(cookies[:visitor]) || returning(Visitor.create) do |visitor|
      cookies[:visitor] = visitor.cookie_id
    end
  end

  def self.active_tab(tab, options = {})
    before_filter options do |controller|
      controller.instance_variable_set(:@tab, tab)
    end
  end
end
