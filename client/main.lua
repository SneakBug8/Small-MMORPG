-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
require("assets.functions")

function tiledinit()
_G.tiled = require "com.ponywolf.ponytiled"
_G.physics = require "physics"
local json = require "json"

display.setDefault("background", 0.2)
physics.start()
-- physics.setDrawMode( "hybrid" )
physics.setGravity( 0,0 )
physics.addBody(character, "dynamic", {bounce=0} )
local mapData = require "login" -- load from lua export
_G.map = tiled.new(mapData)
map.x = display.contentCenterX - map.designedWidth/2 + 16
map.y = display.contentCenterY - map.designedHeight/2 + 16
interface:insert(map)
_G.kk = map:findObject("mybl")
physics.addBody(kk, "static", {} )
end
init()
tiledinit()
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
pnick[message.id] = display.newText(message.nickname, display.contentCenterX,display.contentCenterY, native.systemFont, 16 )
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
coordx=-(((map.x-176+32)/32)-1)
coordy=-(((map.y-256+32)/32)-1)
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
 start()
update()