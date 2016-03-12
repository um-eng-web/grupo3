class Game

	@@count=0
	def initialize(data,casa,fora,oddc,oddf,odde,criador)
		@numero=@@count
		@data=data
		@casa=casa
		@fora=fora
		@oddc=oddc
		@odde=odde
		@oddf=oddf
		@criador=criador
		@@count+=1
	end
	
	#GETS
	def getData
		@data
	end
	
	def getCasa
		@casa
	end
	
	def getFora
		@fora
	end
	
	def getOddc
		@oddc
	end
	
	def getOdde
		@odde
	end
	
	def getOddf
		@oddf
	end
	
	def getCriador
		@criador
	end
	
	#SETS
	def setData(data)
		@data=data
	end
	
	def setCasa(casa)
		@casa=casa
	end
	
	def setFora(fora)
		@fora=fora
	end
	
	def setOddc(oddc)
		@oddc=oddc
	end
	
	def setOdde(odde)
		@odde=odde
	end
	
	def setOddf(oddf)
		@oddf=oddf
	end
	
end