-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
require("functions")
init()
--[[print ("Game started")
crypto = require("crypto")
local composer = require( "composer" )
require("noobhub")
require ("battle")
require ("chat")
require ("functions")
_G.id = math.random (1,1000)

local Background = display.newGroup()  
local objects = display.newGroup()  --this will overlay 'farBackground'  
local interface = display.newGroup()  --and this will overlay 'nearBackground'
_G.location="map0"
coords = display.newText("Hello World!", 100, 200, native.systemFont, 16 )
players={}
timers={}
playergroup=display.newGroup()
local character = display.newImage ("assets/characters/char.png" ,display.contentCenterX , display.contentCenterY)
local idtext = display.newText(id, display.contentCenterX, 0, native.systemFont, 16 )
local upbutton = display.newImage ("assets/gui/up.png" , display.contentCenterX, 400)
local downbutton = display.newImage ("assets/gui/down.png" , upbutton.x , upbutton.y+64)
local leftbutton = display.newImage ("assets/gui/left.png" , upbutton.x-64 , upbutton.y+64)
local rightbutton = display.newImage ("assets/gui/right.png" , upbutton.x+64 , upbutton.y+64)
_G.inventory = display.newImage ("assets/gui/inventory.png",  display.contentWidth-32, 5)
]]--

function  start ()
	-- body
	goto("map0")
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
players[message.nickname]=display.newImage (playergroup, "assets/characters/char3.png",display.contentCenterX,display.contentCenterY)
-- players.nick.x=45
else
end
else
players[message.nickname].x=1000
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
	function goup()
		blockcheck(0,-1)
		tpcheck(0,-1)
map.y=map.y+32
	-- player.y=player.y+32

	reload()
end
upbutton:addEventListener( "tap", goup )
function godown()
blockcheck(0,1)
tpcheck(0,1)
map.y=map.y-32
	reload()
end
downbutton:addEventListener( "tap", godown )
function goleft()
	blockcheck(-1,0)
	tpcheck(-1,0)
map.x=map.x+32
	-- player.x=player.x+32
	reload()
end
leftbutton:addEventListener( "tap", goleft )
function goright()
	blockcheck(1,0)
	tpcheck(1,0)
map.x=map.x-32
	-- player.x=player.x-32
	reload()
end
rightbutton:addEventListener( "tap", goright )

function update()
	reload()
	timer.performWithDelay( 1000, update )
	-- body
end

function goto(scene)
	composer.gotoScene(scene)
	Background:insert(map)
	location = scene
end
function lscene()
	-- body
	return lastscene
end
function showinventory()
	composer.gotoScene("chatbox")
	-- battle(100,1,1,100,2,1)
	-- Don't work
	--[[ composer.showOverlay( "inventory")
	_G.inventoryclose = display.newImage ("assets/gui/closeinventory.png",  display.contentWidth-32, 5)
function closeinv()
    print ("Closeinv")
composer.hideOverlay() ]]--
end

inventory:addEventListener( "tap", showinventory)




-- Max end. Initiation
start()
update()