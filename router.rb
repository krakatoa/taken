require 'singleton'

module Taken
  class Router
    include Singleton

    @@links = {}

    def links
      # TODO is only here for debugging purpose
      @@links
    end
    
    def link(queue_name, opts)
      raise "queue already taken!" if @@links.keys.include?(opts[:class])
      @@links[queue_name] = { :class => opts[:class],
                              :performer => opts[:performer] || queue_name
                            }
    end

  end
end
