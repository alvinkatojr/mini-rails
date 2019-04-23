module ActionController
  module Callbacks
    class Callback
      def initialize(method, options)
        @method = method
        @options = options
      end
    end
    
    def self.include(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def before_action(method, options={})
        before_actions << Callback.new(method, options)
      end

      def before_actions
        @before_action ||= []
      end
    end
  end
end