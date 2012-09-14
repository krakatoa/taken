class QueueController
  include Taken::Controller
  register_queue :build
  register_queue :compile, :performer => :make

  def self.build
  end

  def self.make
  end
end
