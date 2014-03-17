require 'active_support/core_ext'

module ActsAsPaywall
  module Paywall
    def self.included(target)
      target.extend ActsAsPaywall::Paywall::ClassMethods
      target.send(:include, ActsAsPaywall::InstanceMethods)
    end

    module ClassMethods
      def acts_as_paywall(options)
        configuration = {
          permissible_controllers: options.delete(:permissible_controllers) || [],
          free_views: (options.delete(:free_views) || 5).to_i,
          wall_url: options.delete(:wall_url) || root_url,
          content_view_cookie_key: (options.delete(:content_view_cookie_key) || :content_views).to_sym,
          crawler_user_agents: (options.delete(:crawler_user_agents)) || ActsAsPaywall::CRAWLER_USER_AGENTS
        }
        class_attribute :paywall_options
        self.paywall_options = configuration
        send("before_filter", :paywall)
      end
    end
  end
  require 'acts_as_paywall/engine' unless ::Rails.version < "3.1"
end

require 'acts_as_paywall/instance_methods'

class ActionController::Base
  include ActsAsPaywall::Paywall
end
