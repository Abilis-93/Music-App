class User
  attr_accessor :current_disk

  def initialize(music_system, collection_disk)
    @current_disk = nil
    @music_system = music_system
    @collection_disk = collection_disk
  end

  def show_track_name

  end

  def show_track_list

  end

  def take_disk(disk)
    @current_disk.nil? ? @current_disk = disk : "в руках уже есть диск #{@current_disk}"
  end

  def insert_to_ms(disk)
    @current_disk = @music_system.insert(disk)
    @current_disk = nil
  end

  def pull_to_ms
    @music_system.pull
  end

  def insert_to_cd(disk)
    @current_disk = @collection_disk.insert(disk)
    @current_disk = nil
  end

  def pull_to_cd
    @collection_disk.pull(@current_disk)
  end

  def status
    @music_system.status
  end

  def next_track
    @music_system.next_track
  end

  def prev_track
    @music_system.prev_track
  end

  def play
    @music_system.play
  end

  def stop
    @music_system.stop
  end

  def resume_pause
    @music_system.resume_pause
  end
end