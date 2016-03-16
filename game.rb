require_relative 'notifier.rb'
require 'observer'

class Game
	include Observable
	@@count=0
	def initialize(data,casa,fora,oddc,oddf,odde,criador)
		@numero=@@count
		@data=data
		@casa=casa
		@fora=fora
		@oddc=oddc
		@odde=odde
		@oddf=oddf
		@seguidores=Array.new
		@seguidores.push(criador)
		@@count+=1
		add_observer(Notifier.new);
	end
	
	#GETS
	def getNumero
		@numero
	end
	
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
	
	def getSeguidores
		@seguidores
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
	
	def setSeguidores(seg)
		@seguidores=seg
	end
	def to_s
		@numero.to_s + " - " + @data.to_s + " - " + @casa.to_s + " odd casa: " + @oddc.to_s + " /odd empate: " + @odde.to_s + " /" + @fora.to_s + " odd fora: " + @oddf.to_s
	end
	def terminarJogo
		changed
		notify_observers("Jogo Terminado: ",self)
	end
	def changeOdd
		changed
		notify_observers("Mudança de odd: ",self)
	end
end