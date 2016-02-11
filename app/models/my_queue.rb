class MyQueue
  attr_reader :store

  # creates a queue for this specific analyst
  def self.add(analyst)
    new.add(analyst)
  end

  def add(analyst)
    queue_name = analyst.queue
    store.rpush(queue_name, analyst.username[:login])
    true
  end

  def initialize(store = Redis.new)
    @store = store
  end

  def self.online(queue)
    new.online(queue)
  end

  def online(queue)
    store.lrange(queue, 0, -1)
  end
end
