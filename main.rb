require_relative 'user.rb'
require_relative 'bookie.rb'
require_relative 'team.rb'
require_relative 'game.rb'
require_relative 'bet.rb'
require 'date'
class Main

	def initialize()
		
		@listUser=Array.new
		@listBookie=Array.new
		@listJogos=Array.new
		@listEquipas=Array.new
		@utilizador
	
		##User
		@listUser.push(User.new("A","12345","A@A",100))
		@listUser.push(User.new("B","12345","B@A",500))
		@listUser.push(User.new("C","12345","C@A",50))
		
		##Bookie
		@listBookie.push(Bookie.new("A","12345","A@A"))
		@listBookie.push(Bookie.new("A","12345","A@A"))
		
		##Equipa
		@listEquipas.push(Team.new("FCP"))
		@listEquipas.push(Team.new("FCB"))
		@listEquipas.push(Team.new("SPURS"))
		@listEquipas.push(Team.new("BVB"))
		@listEquipas.push(Team.new("PSG"))
		@listEquipas.push(Team.new("JUV"))
		
		##Jogos
		@listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),@listEquipas.at(0),@listEquipas.at(1),2,3,1,@listBookie.at(0)))
		@listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),@listEquipas.at(2),@listEquipas.at(3),2,3,1,@listBookie.at(1)))
		@listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),@listEquipas.at(4),@listEquipas.at(5),2,3,1,@listBookie.at(0)))	
	
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
			bookie=@listBookie.at(i)
			if bookie.getNome == nome && bookie.getPass ==pass
				@utilizador=bookie
				return true
			end
			i+=1
		end while i<@listBookie.size
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
		puts "4)Terminar Jogo"
		puts "0)Sair"
		
		i=gets.to_i
		if i==1
			listarJogos()
			menuBookie()
		elsif i==2
			seguirJogo()
			menuBookie()
		elsif i==3
			criarJogo()
			menuBookie()
		elsif i==4
			terminarJogo()
			menuBookie()
		elsif i==0
			return 0
		else
			menuBookie()
		end
	end
	
	def seguirJogo()
		t=true
		i=0
		begin
			listarJogos()
			puts "Escolha o jogo a seguir:"
			x=gets.to_i
			i=0
			begin
				if @listJogos.at(i).getData()>DateTime.now && @listJogos.at(i).getNumero==x
					t=false
					break
				end
				i+=1
			end while i<@listJogos.size
		end while t
		lista=@utilizador.getAdministracao
		lista.push(@listJogos.at(i))
		@utilizador.setAdministracao(lista)
	end
	
	def criarJogo()
		ec=-1
		begin
			puts "Equipa da Casa: "
			listarEquipas()
			ec=gets.to_i
		end while ec<0 || ec>@listEquipas.size-1
		puts "Odd Casa: "
		oc=gets.to_f
		puts "Odd Empate:"
		oe=gets.to_f
		ef=-1
		begin
			puts "Equipa de Fora: "
			listarEquipas()
			ef=gets.to_i
		end while ef<0 || ef>@listEquipas.size-1 || ef==ec
		puts "Odd Fora: "
		of=gets.to_f
		novoJogo=Game.new(DateTime.now,@listEquipas.at(ec),@listEquipas.at(ef),oc,of,oe,@utilizador)
		@listJogos.push(novoJogo)
		lista=@utilizador.getAdministracao
		lista.push(@listJogos.last)
		@utilizador.setAdministracao(lista)
	end
	
	def listarEquipas()
		i=0
		begin
			puts i.to_s + " - " + @listEquipas.at(i).to_s
			i+=1
		end while i<@listEquipas.size
	end
	
	def terminarJogo()
		t=true
		i=0
		begin
			begin
				if @listJogos.at(i).getData()>DateTime.now && @listJogos.at(i).getCriador==@utilizador
					puts @listJogos.at(i)
				end
				i+=1
			end while i<@listJogos.size
			puts "Escolha o jogo a terminar:"
			x=gets.to_i
			i=0
			begin
				if @listJogos.at(i).getData()>DateTime.now && @listJogos.at(i).getNumero==x && @listJogos.at(i).getCriador==@utilizador
					t=false
					break
				end
				i+=1
			end while i<@listJogos.size
		end while t
		@listJogos.at(i).setData(DateTime.now)
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
		id=gets.to_i
		
		if id == 1
			menuBookieLog()
		elsif id == 2
			menuUserLog()
		elsif id == 0
			return 0
		else 
			bookieOrUser()
		end
	end
	
end

	m=Main.new
	m.bookieOrUser()