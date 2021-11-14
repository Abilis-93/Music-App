load 'modules.rb'
load 'collection_disk.rb'
load 'compact_disk.rb'
load 'music_system.rb'
load 'user.rb'

tracks1 = { 1 => ["AC/DC", "Highway to Hell"], 2 => ["Metallica", "yo!!"], 3 => ["Руки вверх", "18"] }
tracks2 = { 1 => ["Denis kenzo", "Leave"], 2 => ["Kazukii l", "fall"], 3 => ["JGA", "until"] }
tracks3 = { 1 => ["Platon && Joolay", "Over"], 2 => ["Spaceouter", "Life choice!!"], 3 => ["Laniakea", "forbearance"] }

cd1 = CompactDisk.new("The end", tracks1)
cd2 = CompactDisk.new("Loose", tracks2)
cd3 = CompactDisk.new("Choose", tracks3)
disk_collection = CollectionDisk.new
disk_collection.insert(cd1)
disk_collection.insert(cd2)
disk_collection.insert(cd3)

music = MusicSystem.new

user = User.new(music, disk_collection)

puts "Здравствуйте! В вамшем распоряжении есть Музыкальный центр \"Sony X-357\" и Коллекция из 7 компакт дисков!"

loop do
  puts "Выберите объект взаимодействия: 1. Музыкальный центр. 2. Коллекция дисков. 3. Выйти"
  input = gets.chomp.to_i
  if input == 1
    if music.is_inserted
      puts "Выберите действие: "
      puts "1. Вернуться в предыдущему меню."
      puts "2. Запустить проигрывание диска."
      puts "3. Остановить проигрывание диска"
      puts "4. Поставить на паузу/возобновить"
      puts "5. Переключить на след трек"
      puts "6. Переключить на предыдущий трек."
      puts "7. Статус МузЦентра."
      puts "8. Вытащить диск."

      case gets.chomp.to_i
      when 1
        next
      when 2
        user.play
      when 3
        user.stop
      when 4
        user.resume_pause
      when 5
        user.next_track
      when 6
        user.prev_track
      when 7
        user.status
      when 8
        user.pull_to_ms
      else
        puts "неверный выбор. попробуйте снова"
      end

    else
      puts "1. Вставить диск.(Отображать если у пользователя в руках диск)." unless user.current_disk.nil?
      puts "нет диска в руках" if user.current_disk.nil?
      puts "2. Вернуться к предыдущему меню"

      case gets.chomp.to_i
      when 1
        user.insert_to_ms(user.current_disk)
      when 2
        next
      else
        puts "неверный выбор. попробуйте снова"
      end
    end
  elsif input == 2
    puts "Вот ваша коллекция компакт дисков: 1. #{disk_collection.collect_disk}"
    puts "Выберите действие: "
    puts "1. Взять компакт диск."
    puts "2. Положить компакт диск в коллекцию.(Отображать если у пользователя в руках диск)" unless user.current_disk.nil?
    loop do
      case gets.chomp.to_i
      when 1
        puts "Выберите компакт диск: 1. #{cd1.title}, 2. #{cd2.title}, 3. #{cd3.title}"
        change = gets.chomp.to_i
        case change
        when 1
          user.take_disk(cd1)
          puts "#{cd1.title} руках"
          break
        when 2
          user.take_disk(cd2)
          puts "#{cd2.title} руках"
          break
        when 3
          user.take_disk(cd3)
          puts "#{cd3.title} руках"
          break
        else
          puts "неверный выбор. попробуйте снова"
        end
      when 2
        puts "#{user.current_disk.title} размещен в коллекцию дисков"
        user.insert_to_cd(user.current_disk)
        break
      else
        puts "неверный выбор. попробуйте снова"
      end
    end
  elsif input == 3
    break
  else
    puts "неверный выбор. попробуйте снова"
  end
end