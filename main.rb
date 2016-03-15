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

	def registaUser()
		puts "Registe-se no sistema:"
		puts "Nome:"
		nome=gets.chomp
		puts "Email:"
		mail=gets.chomp
		puts "Password:" 
		pass=gets.chomp
		user=User.new(nome,pass, mail, 0)
		@listUser.push(user)
	end
	
	def loginUser()
		puts "Login:"
		puts "Username:"
		nome=gets.chomp
		puts "Password:"
		pass=gets.chomp
		i=0
		begin
			user=listUser.at(i)
			if user.nome == nome && user.pass ==pass
				return true
			end
			i+=1
		end while i<listUser.size
		return false
	end
end