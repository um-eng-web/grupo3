class Bet 

	def initialize(game,previsto,valor,data)
		@game=game
		@previsto=previsto
		@valor=valor
		@data=data
	end
	
	#GETS
	def getGame
		@game
	end
	
	def getPrevisto
		@previsto
	end
	
	#SETS
	def setGame(game)
		@game=game
	end
	
	def setPrevisto(previsto)
		@previsto=previsto
	end
	
	def setValor(valor)
		@valor=valor
	end
	
	def setData(data)
		@data=data
	end
	
end