require "active_support"

class CompactDisk
  attr_reader :uuid, :title, :track_list

  def initialize(title, track_list)
    @uuid = SecureRandom.uuid
    @title = title
    @track_list = track_list
  end
end