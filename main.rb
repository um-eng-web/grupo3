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
	
	def loginBookie()
		puts "Login:"
		puts "Username:"
		nome=gets.chomp
		puts "Password:"
		pass=gets.chomp
		i=0
		begin
			bookie=listBookie.at(i)
			if user.nome == nome && user.pass ==pass
				return true
			end
			i+=1
		end while i<listBookie.size
		return false
	end
	
	
	def menuBookieLog()
		f=loginBookie()
		if f==false
			puts "login errado! Tente novamente"
			menuBookieLog()
		else 
			menuBookie()
		end
	end
	
	def menuBookie()
		puts "Menu"
		puts "1)Ver Jogos"
		puts "2)Seguir Jogo"
		puts "3)Criar Jogo"
		puts "4)Terminar Aposta"
		puts "0)sair"
		
		i=gets.chomp
		if i==1
			listarJogos()
		elsif i==2
			seguirJogo()
		elsif i==3
			criarJogo()
		elsif i==4
			terminarJogo()
		elsif i==0
			return 0
		else
			menuBookie()
		end
	end
	def menuUserLog()
		puts "1)Login"
		puts "2)Registar"
		i=gets.chomp
		if i==1
			f=loginUser()
			if f==false
				puts "login errado! Tente novamente"
				menuUserLog()
			else 
				menuUser()
			end
		elsif i==2
			registaUser()
			menuUserLog
		else
			menuUserLog()
		end
	end
	
	def menuUser()
		puts "Menu"
		puts "1)Ver Jogos"
		puts "2)Fazer Aposta"
		puts "3)Ver Apostas"
		puts "4)Ver Saldo"
		puts "0)sair"
		
		i=gets.chomp
		if i==1
			listarJogos()
		elsif i==2
			makeBet()
		elsif i==3
			listarApostas()
		elsif i==4
			verSaldo()
		elsif i==0
			return 0
		else
			menuUser()
		end
	end
end