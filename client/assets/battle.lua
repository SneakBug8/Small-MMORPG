--[[ function battle (hp1, atk1, def1, hp2, atk2, def2)
		hp1 = hp1 - (atk2*def1)
		print ("First: "..hp1.."-"..atk2.."*"..def1)
		hp2 = hp2 - (atk1*def2)
		print ("Second: "..hp2.."-"..atk1.."*"..def2)
		if hp1<=0 then
				print ("Winner 2")
			elseif hp2<=0 then
				print ("Winner 1")
			end
		if hp1>0 and hp2>0 then
			_G.hp1=hp1
	_G.atk1=atk1
	_G.def1=def1
	_G.hp2=hp2
	_G.atk2=atk2
	_G.def2=def2
			timer.performWithDelay( 250, nextstep)
	end
end

function nextstep()
	battle (hp1, atk1, def1, hp2, atk2, def2)
end
]]-- mechanic battle

-- roleplay battle
function roll(target)
dice = math.random(1,6)
chatsend("/attack "..target.." "..dice)

--[[chance = (10-attack)*10
got = math.random (1,100)
if got>chance then
	reduce_his(attack)
	print ("Attack "..attack)]]--
end
function reduce_his (attack)
-- nothing for now
end