-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
require("assets.functions")




local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

-- Cre

-- Change the button's label tex



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
pnick[message.id].x=players[message.id].x
pnick[message.id].y=players[message.id].y-24
elseif players[message.id]==nil and message.id~=id then
	print ("Нов пакет")
-- _G.nick=tostring(message.nickname)
if message.nickname~="none" then
	local playerx=(coordx-message.coordx)*32
local playery=(coordy-message.coordy)*32
pnick[message.id] = display.newText(message.suff.." "..message.nickname, display.contentCenterX,display.contentCenterY, native.systemFont, 16 )
players[message.id]=display.newImage (playergroup, "assets/characters/"..message.sprite..".png",display.contentCenterX,display.contentCenterY)

end
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
			suff=suff,
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
if dial==1 then
dial=0
native.cancelWebPopup()
end
	temp={coordx+addx,coordy+addy}
for i = 1, #blocks do
	if temp[1]==blocks[i][1] and temp[2]==blocks[i][2] then
		print ("Block!")
		map.x=map.x+(addx*32)
		map.y=map.y+(addy*32)
	end
end
triggercheck(addx,addy)
end
function triggercheck(addx,addy)
if triggers~=nil then
	-- body
	temp={coordx+addx,coordy+addy}
for i = 1, #triggers do
	if temp[1]==triggers[i][2] and temp[2]==triggers[i][3] then
		print ("trigger!")
triggeract(triggers[i][1])
	end
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
	npcturn()
	if myhp<99 then
	myhp=myhp+1
	end
	levelcheck()
	timer.performWithDelay( 5000, update )
	-- body
end

function goto(scene)
	composer.gotoScene("assets."..scene)
	location = scene
	Background:insert(map)
end
function inventorybutt()

if iss==0 then
native.showWebPopup(0,0, 200, 200, "https://sneakbug8.github.io/mmonet/characters/"..nickname..".html")
iss=1
else
native.cancelWebPopup()
iss=0
end
print ("Inv")
--[[
-- Inventory beta
if iis==0 then
showinventory()
iis=1
else
iis=0
hideinventory()
end
]]--

end




function go(addx,addy)
for i = 1, 1000 do
	if players[i]~=nil then
	players[i].x=players[i].x+addx
players[i].y=players[i].y+addy
	pnick[i].x=players[i].x
pnick[i].y=players[i].y-24
	end
end
for i = 1, #npcs do
	if npcs[i]~=nil then
	npcs[i].x=npcs[i].x+addx
npcs[i].y=npcs[i].y+addy
	end
end
if mobs~=nil then
for i = 1, #mobs do
	if mobs[i]~=nil then
	mobs[i].x=mobs[i].x+addx
mobs[i].y=mobs[i].y+addy
	end
end
end
end
-- Max end. Initiation
init()
start()
update()