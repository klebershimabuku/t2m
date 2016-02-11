class User
  attr_accessor :username

  def self.find(username)
    User.new(login: username)
  end

  def initialize(username)
    @username = username
  end

  def queue
    'corporativo'
  end
end
