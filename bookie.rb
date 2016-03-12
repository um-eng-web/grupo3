require_relative 'person.rb'
class Bookie < Person

	def initialize(nome,pass, mail)
		@administracao=Array.new
	end
	
	#GETS
	def getAdministracao
		@valor
	end
	
	#SETS
	def setAdministracao(administracao)
		@administracao=administracao
	end
	
end