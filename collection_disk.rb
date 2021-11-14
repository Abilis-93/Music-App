load 'modules.rb'

class CollectionDisk
  attr_reader :collect_disk

  def initialize
    @collect_disk = []
  end

  def insert(disk)
    @collect_disk << disk
  end

  def pull(disk)
    @collect_disk.delete(disk)
  end

  def collect_disk
    @collect_disk.map { |disk| disk.title }
  end
end