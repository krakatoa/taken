require 'beanstalk-client'

module Taken
  module Adapters
    class Beanstalkd
      def initialize(role, opts)
        @role = role
        @connection = Beanstalk::Pool.new(["#{opts[:host]}:#{opts[:port]}"])
      end
      
      #def init_consumer(opts)
      #end

      #def init_producer(opts)
      #end

      def register_queue(queue_name)
        case @role
          when "consumer"
            @connection.watch(queue_name)
          when "producer"
            @connection.use(queue_name)
        end
      end

      def push(task)
        raise "cannot push tasks using Consumer role!" if @role == "consumer"
        @connection.put(task)
      end

      def pull
        raise "cannot take tasks using Producer role!" if @role == "producer"
        if @connection.stats['current-jobs-ready'] > 0
          job = @connection.reserve
          job.delete
          return job.body
        end
      end
    end
  end
end
