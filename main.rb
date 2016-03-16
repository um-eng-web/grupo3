require_relative 'user.rb'
require_relative 'bookie.rb'
require_relative 'team.rb'
require_relative 'game.rb'
require_relative 'bet.rb'
require 'date'

class Main
	
	def initialize()
		
		$listUser=Array.new
		$listBookie=Array.new
		$listJogos=Array.new
		$listEquipas=Array.new
		@utilizador
	
		##User
		$listUser.push(User.new("A","12345","A@A",100))
		$listUser.push(User.new("B","12345","B@A",500))
		$listUser.push(User.new("C","12345","C@A",50))
		
		##Bookie
		$listBookie.push(Bookie.new("A","12345","A@A"))
		$listBookie.push(Bookie.new("B","12345","A@A"))
		
		##Equipa
		$listEquipas.push(Team.new("FCP"))
		$listEquipas.push(Team.new("FCB"))
		$listEquipas.push(Team.new("SPURS"))
		$listEquipas.push(Team.new("BVB"))
		$listEquipas.push(Team.new("PSG"))
		$listEquipas.push(Team.new("JUV"))
		
		##Jogos
		$listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),$listEquipas.at(0),$listEquipas.at(1),2,3,1,$listBookie.at(0)))
		$listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),$listEquipas.at(2),$listEquipas.at(3),2,3,1,$listBookie.at(1)))
		$listJogos.push(Game.new(DateTime.new(2016,4,1,20,45,00),$listEquipas.at(4),$listEquipas.at(5),2,3,1,$listBookie.at(0)))	
		
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
		$listUser.push(user)
	end
	
	def loginBookie()
		puts "Login:"
		puts "Username:"
		nome=gets.chomp
		puts "Password:"
		pass=gets.chomp
		i=0
		begin
			bookie=$listBookie.at(i)
			if bookie.getNome == nome && bookie.getPass ==pass
				@utilizador=bookie
				return true
			end
			i+=1
		end while i<$listBookie.size
		return false
	end
		

	
	def menuBookie()
		puts "Menu"
		puts "1)Ver Jogos"
		puts "2)Seguir Jogo"
		puts "3)Criar Jogo"
		puts "4)Terminar Jogo"
		puts "5)Mudar odd"
		puts "6)Ver Notificações"
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
		elsif i==5
			changeOdd()
			menuBookie()
		elsif i==6
			verNotificacoes()
			menuBookie()
		elsif i==0
			bookieOrUser()
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
				if $listJogos.at(i).getData()>DateTime.now && $listJogos.at(i).getNumero==x
					t=false
					break
				end
				i+=1
			end while i<$listJogos.size
		end while t
		jogo=$listJogos.at(i).getSeguidores
		jogo.push(@utilizador)
		$listJogos.at(i).setSeguidores(jogo)
	end
	
	
	def listarEquipas()
		i=0
		begin
			puts i.to_s + " - " + $listEquipas.at(i).to_s
			i+=1
		end while i<$listEquipas.size
	end
	
	
	def menuUserLog()
		puts "1)Login"
		puts "2)Registar"
		i=gets.to_i
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
	
	
	def verSaldo()
		puts "Saldo: "+@utilizador.getValor.to_s
	end
	
	
	def listarApostas()
		list=@utilizador.getApostas
		i=0
		begin
			puts list.at(i)
			i+=1
		end while i<list.size
	end
	
	def verNotificacoes()
		list=@utilizador.getNotificacao
		i=0
		begin
			puts list.at(i)
			i+=1
		end while i<list.size
	end
	
	def loginUser()
		puts "Login:"
		puts "Username:"
		nome=gets.chomp
		puts "Password:"
		pass=gets.chomp
		i=0
		begin
			user=$listUser.at(i)
			if user.getNome == nome && user.getPass ==pass
				@utilizador=user
				return true
			end
			i+=1
		end while i<$listUser.size
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
	
	def changeOdd()
		t=true
		i=0
		begin
			begin
				if $listJogos.at(i).getData()>DateTime.now && $listJogos.at(i).getSeguidores.at(0)==@utilizador
					puts $listJogos.at(i)
				end
				i+=1
			end while i<$listJogos.size
			puts "Escolha o jogo a mudar:"
			x=gets.to_i
			i=0
			begin
				if $listJogos.at(i).getData()>DateTime.now && $listJogos.at(i).getNumero==x && $listJogos.at(i).getSeguidores.at(0)==@utilizador
					t=false
					break
				end
				i+=1
			end while i<$listJogos.size
		end while t
		
		puts "Quais sao as odds:"
		puts "Odd Casa"
		oddc=gets.to_f
		puts "Odd Fora"
		oddf=gets.to_f
		puts "Odd Empate"
		odde=gets.to_f
		
		$listJogos.at(i).setOddc(oddc)
		$listJogos.at(i).setOddf(oddf)
		$listJogos.at(i).setOdde(odde)
		
		$listJogos.at(i).changeOdd
	end
	
	def criarJogo()
		ec=-1
		begin
			puts "Equipa da Casa: "
			listarEquipas()
			ec=gets.to_i
		end while ec<0 || ec>$listEquipas.size-1
		puts "Odd Casa: "
		oc=gets.to_f
		puts "Odd Empate:"
		oe=gets.to_f
		ef=-1
		begin
			puts "Equipa de Fora: "
			listarEquipas()
			ef=gets.to_i
		end while ef<0 || ef>$listEquipas.size-1 || ef==ec
		puts "Odd Fora: "
		of=gets.to_f
		puts "Introduza a data  : (AAAA-MM-DD)"
		data=gets.chomp
		puts "Introduza hora : (HH:MM:SS)"
		hora=gets.chomp
		novoJogo=Game.new(DateTime.iso8601(data+"T"+hora+"+00:00"),$listEquipas.at(ec),$listEquipas.at(ef),oc,of,oe,@utilizador)
		$listJogos.push(novoJogo)
	end
	
	def terminarJogo()
		t=true
		i=0
		begin
			begin
				if $listJogos.at(i).getData()>DateTime.now && $listJogos.at(i).getSeguidores.at(0)==@utilizador
					puts $listJogos.at(i)
				end
				i+=1
			end while i<$listJogos.size
			puts "Escolha o jogo a terminar:"
			x=gets.to_i
			i=0
			begin
				if $listJogos.at(i).getData()>DateTime.now && $listJogos.at(i).getNumero==x && $listJogos.at(i).getSeguidores.at(0)==@utilizador
					t=false
					break
				end
				i+=1
			end while i<$listJogos.size
		end while t
		$listJogos.at(i).setData(DateTime.now)
		$listJogos.at(i).terminarJogo
	end
	
	def menuUser()
		puts "Menu"
		puts "1)Ver Jogos"
		puts "2)Fazer Aposta"
		puts "3)Ver Apostas"
		puts "4)Ver Saldo"
		puts "5)Carregar Saldo"
		puts "6)Ver Notificações"
		puts "0)sair"
		
		i=gets.to_i
		if i==1
			listarJogos()
			menuUser()
		elsif i==2
			makeBet()
			menuUser()
		elsif i==3
			listarApostas()
			menuUser()
		elsif i==4
			verSaldo()
			menuUser()
		elsif i==5
			carregarSaldo()
			menuUser()
			elsif i==6
			verNotificacoes()
			menuUser()
		elsif i==0
			
			bookieOrUser()
		else
			menuUser()
		end
	end
	
	def makeBet()
		t=true
		i=0
		begin
			listarJogos()
			puts "Escolha o jogo a apostar:"
			x=gets.to_i
			begin
				if $listJogos.at(i).getData()>DateTime.now && $listJogos.at(i).getNumero==x
					t=false
					break
				end
				i+=1
			end while i<$listJogos.size
		end while t
		a=0
		begin
			puts "Apostar em:"
			puts "1-Casa"
			puts "0-Empate"
			puts "2-Fora"
			a=gets.to_i
		end while a<0 || a>2
		val=0
		begin
			puts "Quanto apostar:"
			val=gets.to_f
		end while @utilizador.getValor<val
		
		@utilizador.setValor(@utilizador.getValor-val)
		lista=@utilizador.getApostas
		lista.push(Bet.new($listJogos.at(i),a,val,DateTime.now))
		@utilizador.setApostas(lista)
		jogo=$listJogos.at(i).getSeguidores
		jogo.push(@utilizador)
		$listJogos.at(i).setSeguidores(jogo)
		puts $listJogos.at(i).getSeguidores.size
	
	end
	
	def carregarSaldo()
		puts "Quanto carregar:"
		i=gets.to_f
		@utilizador.setValor(@utilizador.getValor+i)
	end
	
	def listarJogos()
		i=0
		begin
			if $listJogos.at(i).getData()>DateTime.now
				puts $listJogos.at(i)
			end
			i+=1
		end while i<$listJogos.size
	end

end
	m=Main.new
	m.bookieOrUser()