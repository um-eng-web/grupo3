require_relative 'user.rb'
require_relative 'bookie.rb'
require_relative 'team.rb'
require_relative 'game.rb'

class Main

	@listUser=Array.new
	@listBookie=Array.new
	@listAposta=Array.new
	@listJogos=Array.new
	@listEquipas=Array.new

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