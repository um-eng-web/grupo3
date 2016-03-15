require_relative 'user.rb'
require_relative 'bookie.rb'
require_relative 'team.rb'
require_relative 'game.rb'
require_relative 'bet.rb'
require 'date'
class Main

	@listUser=Array.new
	@listBookie=Array.new
	@listAposta=Array.new
	@listJogos=Array.new
	@listEquipas=Array.new
	
	def loader()
		##User
		listUser.push(User.new("A","12345","A@A",100))
		listUser.push(User.new("B","12345","B@A",500))
		listUser.push(User.new("C","12345","C@A",50))
		
		##Bookie
		listBookie.push(Bookie.new("A","12345","A@A"))
		listBookie.push(Bookie.new("A","12345","A@A"))
		
		##Equipa
		listEquipas.push(Team.new("FCP"))
		listEquipas.push(Team.new("FCB"))
		listEquipas.push(Team.new("SPURS"))
		listEquipas.push(Team.new("BVB"))
		listEquipas.push(Team.new("PSG"))
		listEquipas.push(Team.new("JUV"))
		
		##Jogos
		listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),listEquipas.at(0),listEquipas.at(1),2,3,1,listBookie.at(0)))
		listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),listEquipas.at(2),listEquipas.at(3),2,3,1,listBookie.at(1)))
		listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),listEquipas.at(4),listEquipas.at(5),2,3,1,listBookie.at(0)))	
	
	end
	
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
	def bookieOrUser()
		puts "Bem vindo"
		puts "1)Bookie"
		puts "2)User"
		puts "0)Sair"
		id=gets.chomp
		if id == 1
			menuBookieLog()
		elsif id == 2
			menuUser()
		elsif id == 0
			return 0
		else 
			bookieOrUser()
		end
	end
	
end