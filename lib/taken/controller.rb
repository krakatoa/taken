module Taken
  module Controller
    @@links = {}

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def register_queue(queue_name, opts={})
        opts[:class] = self.to_s
        Taken::Router.instance.link(queue_name, opts)
      end
    end
  end
end
