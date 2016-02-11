class UserManager
  attr_accessor :store

  def self.add_online(user)
    new.add_online(user)
  end

  def initialize(store = Redis.new)
    @store = store
  end

  def add_online(user)
    store.rpush('online', user)
    true
  end

  def list_online
    store.lrange('online', 0, -1)
  end

end
