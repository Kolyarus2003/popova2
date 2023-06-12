if Gem.win_platform?

    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    
    Encoding.default_internal = __ENCODING__

    [STDIN, STDOUT].each do |io|

        io.set_encoding(Encoding.default_external, Encoding.default_internal)
        
    end
end

require 'io/console'
require 'pony'
zaa = "laba.ratorka@mail.ru"


puts "Введите пароль от вашей почты #{zaa} для отправки письма:"
password = STDIN.gets.chomp

puts "Кому отправить письмо? Введите адрес:"
send_to = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.chomp.encode("UTF-8")>

Pony.mail({

    :subject => "Привет из программы на руби!",
    :body => body,
    :to => send_to,
    :from => zaa,
    :via => :smtp,
    :via_options => {
        :address => 'stmp.mail.ru',
        :port => '465',
        :tls => true,
        :user_name => zaa,
        :password => password,
        :authentication => :plain
    }
})
