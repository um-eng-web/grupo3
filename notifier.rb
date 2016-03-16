class Notifier
	
	def update(txt,game)
		i=0
		begin
			j=0
			begin
				if game.getSeguidores.at(i)==$listBookie.at(j)
					noti=$listBookie.at(i).getNotificacao
					noti.push(txt +game.to_s)
					$listBookie.at(i).setNotificacao(noti)
				end
				j+=1
			end while j<$listBookie.size
			j=0
			begin
				if game.getSeguidores.at(i)==$listUser.at(j)
					noti=$listUser.at(i).getNotificacao
					noti.push(txt+game.to_s)
					$listUser.at(i).setNotificacao(noti)
				end
				j+=1
			end while j<$listUser.size
			i+=1
		end while i<game.getSeguidores.size
	end 
end