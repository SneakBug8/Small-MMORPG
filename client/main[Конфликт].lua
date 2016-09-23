-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
require("assets.functions")
init()

function  start ()
	-- body
	goto("login")
	hub = noobhub.new({ server = "46.4.76.236"; port = 1337; });
hub:subscribe({
	channel = "game";
	callback = reader
	});
reload()
end

function reader(message)
_G.coordx=-(((map.x-1024-176+32)/32)-1)
_G.coordy=-(((map.y-1024-256+32)/32)-1)
if message.type=="move" then
if message.location==location then
if players[message.id]~=nil and message.id~=id then
-- timers[message.nickname]=system.getTimer()
-- checkexit(message,timers)
	local playerx=(coordx-message.coordx)*32
local playery=(coordy-message.coordy)*32
players[message.id].x= display.contentCenterX-playerx
players[message.id].y = display.contentCenterY-playery
print (players[message.id].x.." "..players[message.id].y)
elseif players[message.id]==nil and message.id~=id then
	print ("Нов пакет")
-- _G.nick=tostring(message.nickname)
players[message.id]=display.newImage (playergroup, "assets/characters/"..message.sprite..".png",display.contentCenterX,display.contentCenterY)
-- players.nick.x=45
else
end
else
end
elseif message.type == "chat" then
-- Chat reading
chatinit(message)
end
end

function reload(type)
	if type~=nil then
	else
		type="move"
	end
coordx=-(((map.x-1024-176+32)/32)-1)
coordy=-(((map.y-1024-256+32)/32)-1)
coords.text = "X: "..coordx.." Y: "..coordy
hub:publish({
		message = {
			nickname=nickname,
			id=id,
			type=type,
			sprite=sprite,
			location=location,
			coordx = coordx,
			coordy = coordy,
			timestamp = system.getTimer() }
		})
print ("Packet sent")
hpreload()
end

	-- body
function blockcheck(addx,addy)
	-- body
	temp={coordx+addx,coordy+addy}
for i = 1, #blocks do
	if temp[1]==blocks[i][1] and temp[2]==blocks[i][2] then
		print ("Block!")
		map.x=map.x+(addx*32)
		map.y=map.y+(addy*32)
	end
end
end
function battlecheck(addx,addy)
temp={coordx+addx,coordy+addy}
for i = 1, #tps do
	if temp[1]==battles[i][1] and temp[2]==battles[i][2] then
		print ("Battle!")
		battle(myhp,myatk,mydef,battles[i][3],battles[i][4],battles[i][5])
	end
end
end
function tpcheck(addx,addy)
	-- body
	temp={coordx+addx,coordy+addy}
for i = 1, #tps do
	if temp[1]==tps[i][1] and temp[2]==tps[i][2] then
		print ("TP!")
		goto(tps[i][3])
	end
end
end

function update()
	reload()
	timer.performWithDelay( 5000, update )
	-- body
end

function goto(scene)
	composer.gotoScene("assets."..scene)
	location = scene
	Background:insert(map)
end
function showinventory()
if iss==0 then
native.showWebPopup(0,0, 200, 200, "http://www.etrt.ru/characters/"..nickname..".html")
iss=1
else
native.cancelWebPopup()
iss=0
end
end
inventory:addEventListener( "tap", showinventory)



function go(addx,addy)
for i = 1, 1000 do
	if players[i]~=nil then
	players[i].x=players[i].x+addx
players[i].y=players[i].y+addy
	end
end
end
-- Max end. Initiation
start()
update()