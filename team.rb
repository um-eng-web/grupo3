class Team

	def initialize(nome)
		@nome=nome
	end
	
	#GETS
	def getNome
		@nome
	end
	
	#SETS
	def setNome(nome)
		@nome=nome
	end
	
	def to_s
		"Nome: " + @nome
	end
	
end