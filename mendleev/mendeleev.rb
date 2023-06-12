if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
  end
  
  table = {
    'H' => 'Кавендиш',
    'He' => 'Локьер, Жансен, Рамзай',
    'Li' => 'Арфведсон',
    'Be' => 'Воклен',
    'B' => 'Дэви и Гей-Люссак',
    'C' => 'неизвестен',
    'N' => 'Резерфорд',
    'O' => 'Пристли и Шееле',
    'F' => 'Муассан',
    'Ne' => 'Рамзай и Траверс'
  }
  
  puts "У нас всего элементов: #{table.keys.size}"
  
  puts table.keys
  
  puts 'О каком элементе хотите узнать?'
  element = gets.chomp
  
  if table.key?(element)
    puts "Первооткрывателем этого элемента считается: #{table[element]}"
  else
    puts 'Извините, про такой элемент мы еще не знаем.'
  end