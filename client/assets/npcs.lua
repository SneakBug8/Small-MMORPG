function npcturn ()
mobturn()
for i = 1, #npcs do
gox=math.random(-1,1)
goy=math.random(-1,1)
npcs[i].x=npcs[i].x+(gox*32)
npcs[i].y=npcs[i].y+(goy*32)
end
end
function mobturn ()
if mobs~=nil then
for i = 0, #mobs do
if mobs[i]~=nil then
if mobs[i].x==character.x and mobs[i].y==character.y then
else
gox=math.random(-1,1)
goy=math.random(-1,1)
blocknpccheck(i,gox,goy)
mobs[i].x=mobs[i].x+(gox*32)
mobs[i].y=mobs[i].y+(goy*32)
end
end
end
end
end

function mobcheck (addx,addy)
if mobs~=nil then
for i = 0, #mobs do
if mobs[i]~=nil then
	if character.x+(addx*32)==mobs[i].x and character.y+(addy*32)==mobs[i].y then
       battle (i)
	end
	end
end
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

function blocknpccheck(r,addx,addy)
	-- body
coordnx=coordx+((mobs[r].x-character.x)/32)+addx
coordny=coordy+((mobs[r].y-character.y)/32)+addy
print (coordnx.." | "..coordny)
for i = 1, #blocks do
	if coordnx==blocks[i][1] and coordny==blocks[i][2] then
	print ("Blocking npc")
		mobs[r].x=mobs[r].x-(addx*32)
mobs[r].y=mobs[r].y-(addy*32)
	end
end
end