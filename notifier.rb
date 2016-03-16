class Notifier
	
	def update(txt,game)
		i=0
		begin
			j=0
			begin
				if game.getSeguidores.at(i)==$listBookie.at(j)
				
					noti=$listBookie.at(j).getNotificacao
					noti.push(txt +game.to_s)
					$listBookie.at(j).setNotificacao(noti)
				end
				j+=1
			end while j<$listBookie.size
			j=0
			
			begin
				
				if game.getSeguidores.at(i).getNumero==$listUser.at(j).getNumero
				
					noti=$listUser.at(j).getNotificacao
					noti.push(txt+game.to_s)
					$listUser.at(j).setNotificacao(noti)
				
				end
				
				j+=1
			end while j<$listUser.size
			i+=1
		end while i<game.getSeguidores.size
	end 
end