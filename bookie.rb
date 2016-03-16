require_relative 'person.rb'
class Bookie < Person

	def initialize(nome,pass, mail)
		super(nome,pass,mail)
		@administracao=Array.new
	end
	
	#GETS
	def getAdministracao
		@administracao
	end
	
	#SETS
	def setAdministracao(administracao)
		@administracao=administracao
	end
	
end