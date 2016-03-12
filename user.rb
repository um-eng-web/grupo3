require_relative 'person.rb'
class User < Person

	def initialize(nome,pass, mail,valor)
		super(nome,pass,mail)
		@valor=valor
		@apostas=Array.new
	end
	
	#GETS
	def getValor
		@valor
	end
	
	def getApostas
		@apostas
	end
	
	#SETS
	def setValor(valor)
		@valor=valor
	end
	
	def setApostas(apostas)
		@apostas=apostas
	end
	
end