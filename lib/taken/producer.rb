module Taken
  class Producer
    def initialize(adapter, opts={})
      begin
        const = Taken::Adapters.const_get(adapter.to_s.split("_").collect(&:capitalize).join)
      rescue NameError
        raise "adapter '#{adapter}' is not available!"
      end
      @adapter = const.new("producer", opts)
    end

    def register(queue_name)
      @adapter.register_queue(queue_name)
    end

    def push(task)
      @adapter.push(task)
    end
  end
end
