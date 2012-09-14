require './lib/taken'
require './example'

#puts Taken::Router.instance.links.inspect

require './lib/taken/adapters/beanstalkd'

consumer = Taken::Consumer.new(:beanstalkd, {:host => '127.0.0.1', :port => '11300'})
consumer.register(:task)

producer = Taken::Producer.new(:beanstalkd, {:host => '127.0.0.1', :port => '11300'})
producer.register(:task)

producer.push({:bla => 'blun'})
puts consumer.pull.inspect
