require_relative 'user.rb'
class Main
	puts "Registe-se no sistema:"
	puts "Nome:"
	nome=gets.chomp
	puts "Email:"
	mail=gets.chomp
	puts "Password:" 
	pass=gets.chomp
	user=User.new(nome,pass, mail, 0)
	puts user.getNome
end