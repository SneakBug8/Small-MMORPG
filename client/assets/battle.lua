function battle (hp1, atk1, def1, hp2, atk2, def2)
		hp1 = hp1 - (atk2*def1)
		myhp=hp1
		chatprint("Вы нанесли "..tostring(atk2*def1).." урона.")
		print ("First: "..hp1.."-"..atk2.."*"..def1)
		hp2 = hp2 - (atk1*def2)
		chatprint("Вы получили "..tostring(atk1*def2).." урона.")
		print ("Second: "..hp2.."-"..atk1.."*"..def2)
		if hp1<=0 then
				print ("Winner 2")
				chatprint("Вы проиграли монстру!")
			elseif hp2<=0 then
			chatprint("Вы убили монстра!")
				print ("Winner 1")
			end
		if hp1>0 and hp2>0 then
			_G.hp1=hp1
	_G.atk1=atk1
	_G.def1=def1
	_G.hp2=hp2
	_G.atk2=atk2
	_G.def2=def2
			timer.performWithDelay( 500, nextstep)
	end
end

function nextstep()
	battle (hp1, atk1, def1, hp2, atk2, def2)
	hpreload()
end