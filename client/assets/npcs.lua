function npcturn ()
for i = 1, #npcs do
gox=math.random(0,1)
goy=math.random(0,1)
npcs[i].x=npcs[i].x+(gox*32)
npcs[i].y=npcs[i].y+(goy*32)
end
end

function dialcheck (addx,addy)
if dialnpcs~=nil then
	temp={coordx+addx,coordy+addy}
for i = 1, #dialnpcs do
	if temp[1]==dialnpcs[i][1] and temp[2]==dialnpcs[i][2] then
		print ("NPC!")
        dialog(dialnpcs[i][3])
	end
end
end
end

function dialog(num)
native.showWebPopup(0,0, 200, 200, "http://www.etrt.ru/dialogs/"..num..".html")
dial=1
end