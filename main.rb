require_relative 'user.rb'
class Main
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