class Protocol::FinalizerService
  def initialize(protocol)
    @protocol = protocol
  end

  def finalize
    @protocol.finalize!
  end
end
