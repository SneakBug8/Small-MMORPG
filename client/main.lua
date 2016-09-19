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
	goto("map0")
	hub = noobhub.new({ server = "46.4.76.236"; port = 1337; });
hub:subscribe({
	channel = "game";
	callback = reader
	});
reload()
goto("map0")
end

function reader(message)
_G.coordx=-(((map.x-1024-176+32)/32)-1)
_G.coordy=-(((map.y-1024-256+32)/32)-1)
if message.type=="move" then
if message.location==location then
if players[message.nickname]~=nil and message.nickname~=id then
-- timers[message.nickname]=system.getTimer()
-- checkexit(message,timers)
	local playerx=(coordx-message.coordx)*32
local playery=(coordy-message.coordy)*32
players[message.nickname].x= display.contentCenterX-playerx
players[message.nickname].y = display.contentCenterY-playery
print (players[message.nickname].x.." "..players[message.nickname].y)
elseif players[message.nickname]==nil and message.nickname~=id then
	print ("Нов пакет")
-- _G.nick=tostring(message.nickname)
players[message.nickname]=display.newImage (playergroup, "assets/characters/"..message.sprite..".png",display.contentCenterX,display.contentCenterY)
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
			nickname=id,
			type=type,
			sprite=sprite,
			location=location,
			coordx = coordx,
			coordy = coordy,
			timestamp = system.getTimer() }
		})
print ("Packet sent")
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
	timer.performWithDelay( 1000, update )
	-- body
end

function goto(scene)
	composer.gotoScene("assets."..scene)
	location = scene
	Background:insert(map)
end
function showinventory()
end
inventory:addEventListener( "tap", showinventory)


-- Max end. Initiation
start()
update()