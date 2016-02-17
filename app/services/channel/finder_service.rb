class Channel::FinderService
  def find_by_name(name)
    Channel.find_by_name(name)
  end
end
