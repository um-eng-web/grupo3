class Person

	@@count=0
	
	def initialize(nome,pass, mail)
		@numero=@@count
		@nome=nome
		@pass=pass
		@mail=mail
		@@count+=1
		@notificacao=Array.new
	end
	
	#GETS
	def getNome
		@nome
	end
	
	def getNumero
		@numero
	end
	
	def getPass
		@pass
	end
	
	def getMail
		@mail
	end
	def getNotificacao
		@notificacao
	end
	#SETS
	def setNome(nome)
		@nome=nome
	end
	
	def setPass(pass)
		@pass=pass
	end
	
	def setMail(mail)
		@mail=mail
	end
	def setNotificacao(noti)
		@notificacao=noti
	end
	
end