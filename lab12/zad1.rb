require 'io/console'
require "pony"
zaa = ""
puts "Введите пароль от вашей почты #{zaa} для отправки письма:"


password = STDIN.noecho(&:gets).chomp 

puts "Кому отправить письмо? Введите адрес:"
send_to = STDIN.gets.chomp

puts "Что написать в письмо?"
body = STDIN.gets.chomp.encode("UTF-8")

Pony.mail({
    :subject => "Привет из программы на руби!",
    :body => body,
    :to => send_to
    :from => zaa,
    :via => :smtp,
    :via_options => {
        :address => 'gradso.mail.ru',
        :port => '465',
        :tls => true,
        :user_name => 'zaa',
        :password => password,
        :authentication => :plain
    }
})