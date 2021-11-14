require "active_support"

class CompactDisk
  attr_reader :uuid, :title, :track_list

  def initialize(title, track_list)
    @uuid = SecureRandom.uuid
    @title = title
    @track_list = track_list
    @index_current_element = 1
  end

  def next_element
    return "конец списка" if next_element?
    @index_current_element += 1
    @track_list[@index_current_element]
  end

  def next_element?
    @track_list[@index_current_element].nil?
  end
end