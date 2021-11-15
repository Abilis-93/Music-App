require "active_support"

class MusicSystem
  MODEL = "Sony X-35"

  attr_reader :uuid, :is_inserted, :track_number, :current_track

  def initialize(uuid = SecureRandom.uuid)
    @uuid = uuid
    @is_inserted = false
    @disk = nil
    @track_number = 1
    @track_status = ["остановлен", "играет", "пауза"]
    @status = @track_status[0]
  end

  def insert(disk)
    if !is_inserted
      @disk = disk
      @is_inserted = true
      puts "#{disk.title} вставлен"
    else
      puts "#{disk} уже вставлен"
    end
  end

  def pull
    if is_inserted
      @is_inserted = false
      puts "#{@disk.title} вытащен"
      @disk = nil
    else
      puts "Нечего вытаскивать"
    end
  end

  def status
    puts is_inserted ? "Диск есть" : "Диска нет"
    puts "Музыка сейчас: #{@status}"
    puts "текущий трек: #{@current_track}"
  end

  def next_track
    return puts "конец списка" if @disk.track_list.nil?
    puts "переключение на след-й трек #{@disk.track_list[@track_number += 1]}" if @status == @track_status[1]
  end

  def prev_track
    return puts "Вы вернулись на самое начало списка треков" if @track_number == 0
    puts "переключение на пред-щий трек #{@disk.track_list[@track_number -= 1]}" if @status == @track_status[1]
  end

  def play
    return puts "Вставте диск:" if @disk.nil?
    if @status == @track_status[1]
      puts "трек уже проигрывается"
    else
      @status = @track_status[1]
      @current_track = @disk.track_list.first
      puts "начинает играть трек #{@current_track}"
    end

  end

  def stop
    return puts "#{current_track} уже остановлен" if @status == @track_status[0]
    @status = @track_status[0]
    puts "#{@current_track} #{@status}"
    @current_track = nil
  end

  def resume_pause
    return pause if @status == @track_status[1]
    return resume if @status == @track_status[2]
  end

  private

  def pause
    return puts "нечего останавливать" if @current_track.nil?
    @status = @track_status[2]
    puts "#{@current_track} пристановлен"
  end

  def resume
    return puts "нечего возобновлять" if @current_track.nil?
    puts "#{@current_track} возобновлен"
    @status = @track_status[1]
  end
end