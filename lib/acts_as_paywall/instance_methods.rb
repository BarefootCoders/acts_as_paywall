require 'acts_as_paywall'
require_relative 'crawlers.rb'

module ActsAsPaywall::InstanceMethods
  attr_accessor :permissible_controllers
  attr_accessor :free_views
  attr_accessor :wall_url

  def paywall
    redirect_to_paywall! if should_redirect_to_paywall?
    increment_content_views!
  end

  def redirect_to_paywall!
    redirect_to paywall_option(:wall_url)
  end

  def increment_content_views!
    return true if skip_paywall?
    views = content_views
    views += 1
    cookies[paywall_option(:content_view_cookie_key)] = views.to_s
  end

  def free_views_used?
    content_views.to_i > paywall_option(:free_views) unless skip_paywall?
  end

  def content_views
    (cookies[paywall_option(:content_view_cookie_key)] ||= 0).to_i
  end

  def skip_paywall?
    permissible_controller?
  end

  def should_redirect_to_paywall?
    free_views_used? && !is_google? && !skip_paywall? && !(current_user.present? && current_user.subscribed?)
  end

  def permissible_controller?
    paywall_option(:permissible_controllers).include?(controller_name)
  end

  def paywall_option(key)
    self.class.paywall_options[key.to_sym]
  end

  def is_google?
    paywall_option(:crawler_user_agents).include?(request.env['HTTP_USER_AGENT'])
  end
end
