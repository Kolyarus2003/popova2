if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
  end
  
  puts 'Врага какого персонажа вы хотите узнать?'
  hero = STDIN.gets.encode('UTF-8').chomp
  
  heros_antiheros = {
    'Бэтмен' => 'Джокер',
    'Холмс' => 'Мориарти',
    'Буратино' => 'Карабас-Барабас'
  }
  
  heros_antiheros['Моцарт'] = 'Сальери'
  
  heros_antiheros.delete('Моцарт')
  
  if heros_antiheros.key?(hero)
    puts "Враг этого героя: #{heros_antiheros[hero]}"
  else
    puts 'Не удалось найти врага'
  end
  
  puts heros_antiheros.keys