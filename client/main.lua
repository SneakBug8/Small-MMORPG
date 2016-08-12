-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )
-- Your code here
print ("Game started")
crypto = require("crypto")
require("noobhub")
require( "widget" )
--[[local composer = require( "composer" )
local scene = composer.newScene()
local mui = require( "materialui.mui" )
mui.init()]]--
local items= {0,0,0,0,0,0,0,0,0}
local invitem1 = 0
local invitem2 = 0
local invitem3 = 0
local invitem4 = 0
local invitem5 = 0
local invitem6 = 0
local invitem7 = 0
local invitem8 = 0
local invitem9 = 0
local scene  = display.newGroup()
local controls = display.newGroup()
local inventory = display.newGroup()
items[1]=1
local id = math.random(0,100)
local map = display.newImage (scene,"map1.png",  display.contentCenterX+16, display.contentCenterY+16)
-- local layer2 = display.newImage (map, "layer2.png")
local character = display.newImage (scene,"char.png" ,display.contentCenterX , display.contentCenterY)
local player = display.newImage (scene,"char.png",1000,1000)
local upbutton = display.newImage (controls,"up.png" , 165, 400)
local downbutton = display.newImage (controls,"down.png" , upbutton.x , upbutton.y+64)
local leftbutton = display.newImage (controls,"left.png" , upbutton.x-64 , upbutton.y+64)
local rightbutton = display.newImage (controls,"right.png" , upbutton.x+64 , upbutton.y+64)
local invbutton = display.newImage (controls,"inv.png" , rightbutton.x+64 , rightbutton.y-64)

local coords = display.newText(controls,"Hello World!", 100, 200, native.systemFont, 16 )
local menu = display.newImage (inventory,"menu.jpg" ,display.contentCenterX , display.contentCenterY)

local chatinput = native.newTextField(controls,display.contentCenterX, display.contentCenterY, 250, 25)
local send = display.newImage (controls,"send.png" ,display.contentCenterX+135, 0)

--[[mui.newNavbar({
        name = "navbar_demo",
        --width = mui.getScaleVal(500), -- defaults to display.contentWidth
        height = mui.getScaleVal(70),
        left = 0,
        top = 0,
        fillColor = { 0.63, 0.81, 0.181 },
        activeTextColor = { 1, 1, 1, 1 },
        padding = mui.getScaleVal(10),
    })]]--

local mycloud = display.newText("", character.x, character.y-25, native.systemFont, 16 )
local hiscloud = display.newText("", player.x, player.y-25, native.systemFont, 16 )
chatinput.anchorX=0.5
chatinput.anchorY=0.5
chatinput.x = display.contentCenterX-25
chatinput.y=0
chatinput.height=25
local packet={}
local x=0


function sendchat()
mycloud.text = chatinput.text
packet[1]=id
packet[2]="chat"
packet[5]=chatinput.text
hub:publish({
		message = {
			action  =  packet,
			timestamp = system.getTimer()
		}
		})
chatinput.text=""
timer.performWithDelay( 1000, removecloud, 1 )
end
send:addEventListener( "tap", sendchat )
function reload ()
mycloud.x=character.x
mycloud.y=character.y-25
hiscloud.x=player.x
hiscloud.y=player.y-25
	-- None for now
	if character.x>map.x+1024 then
		map.x=map.x+32
		character.x=map.x+1024-16
		elseif character.y>map.y+1024 then
			map.y=map.y+32
			character.y=map.y+1024-16
elseif character.y<map.y-1024 then
			map.y=map.y-32
			character.y=map.y-1024+16
		elseif character.x<map.x-1024 then
		map.x=map.x-32
		character.x=map.x-1024+16	
		end
coordx=-(((map.x-1024-176+32)/32)-1)
coordy=-(((map.y-1024-256+32)/32)-1)
coords.text = "X: "..coordx.." Y: "..coordy
local packet={}
packet[1]=id
packet[2]="move"
packet[3]=coordx
packet[4]=coordy
hub:publish({
		message = {
			action  =  packet,
			timestamp = system.getTimer()
		}
		})
end

function goup()
	--[[map.y=map.y+32
	player.y=player.y+32
	reload()]]--
function move ()
		map.y=map.y+1
		player.y=player.y+1
		reload()
	end
	timer.performWithDelay( 1, move, 32)
end
upbutton:addEventListener( "tap", goup )
function godown()
	--[[map.y=map.y-32
	player.y=player.y-32
	reload()]]--
	function move ()
		map.y=map.y-1
	player.y=player.y-1
	reload()
	end
	timer.performWithDelay( 1, move, 32)
end
downbutton:addEventListener( "tap", godown )
function goleft()
	--[[map.x=map.x+32
	player.x=player.x+32
	reload()]]--
	function move ()
	map.x=map.x+1
	player.x=player.x+1
	reload()
	end
	timer.performWithDelay( 1, move, 32)
end
leftbutton:addEventListener( "tap", goleft )
function goright()
	--[[map.x=map.x-32
	player.x=player.x-32
	reload()]]--
	function move ()
	map.x=map.x-1
	player.x=player.x-1
	reload()
	end
	timer.performWithDelay( 1, move, 32)
end
rightbutton:addEventListener( "tap", goright )
function reader(message)
mycloud.x=character.x
mycloud.y=character.y-25
hiscloud.x=player.x
hiscloud.y=player.y-25
coordx=-(((map.x-1024-176+32)/32)-1)
coordy=-(((map.y-1024-256+32)/32)-1)
print (message.action)
if message.action[1]==id then
	else
if message.action[2]=="move" then
print (message.action[3].." "..message.action[4])
local playerx=(coordx-message.action[3])*32
local playery=(coordy-message.action[4])*32
player.x = display.contentCenterX-playerx
player.y = display.contentCenterY-playery
elseif message.action[2]=="chat" then
	if message.action[1]==id then
	else
hiscloud.text=message.action[5]
timer.performWithDelay( 1000, removecloud, 1 )
end
end
end
end
function start ()
hub = noobhub.new({ server = "46.4.76.236"; port = 1337; });
hub:subscribe({
	channel = "game";
	callback = reader
	});
	reload()
menu:removeSelf()
	end
	menu:addEventListener( "tap",start )

	function removecloud()
		-- body
		mycloud.text=""
		hiscloud.text=""
	end

function getitem(itemname)
itemid=items[itemname]
return itemid
end



function showinventory()
	inventory.x=0
invbackground = display.newImage (inventory,"invbackground.png" ,display.contentCenterX , display.contentCenterY)
invitem1= display.newImage (inventory,"0.png", display.contentCenterX-65,display.contentCenterY-65)
invitem2= display.newImage (inventory,"0.png", display.contentCenterX,display.contentCenterY-65)
invitem3= display.newImage (inventory,"0.png", display.contentCenterX+65,display.contentCenterY-65)
invitem4= display.newImage (inventory,"0.png", display.contentCenterX-65,display.contentCenterY)
invitem5= display.newImage (inventory,"0.png", display.contentCenterX,display.contentCenterY)
invitem6= display.newImage (inventory,"0.png", display.contentCenterX+65,display.contentCenterY)
invitem7= display.newImage (inventory,"0.png", display.contentCenterX-65,display.contentCenterY+65)
invitem8= display.newImage (inventory,"0.png", display.contentCenterX,display.contentCenterY+65)
invitem9= display.newImage (inventory,"0.png", display.contentCenterX+65,display.contentCenterY+65)

local closeinv = display.newImage (inventory,"closeinv.png" , display.contentWidth-32, 15)

if #tostring(items[1]>0) then
id = getitem(1)
invitem1= display.newImage (inventory,id..".png", display.contentCenterX-65,display.contentCenterY-65)
end
if #tostring(items[2]>0) then
id = getitem(2)
invitem2= display.newImage (inventory,id..".png", display.contentCenterX,display.contentCenterY-65)
end
if #tostring(items[3]>0) then
id = getitem(3)
invitem3= display.newImage (inventory,id..".png", display.contentCenterX+65,display.contentCenterY-65)
end
if #tostring(items[4]>0) then
id = getitem(4)
invitem4= display.newImage (inventory,id..".png", display.contentCenterX-65,display.contentCenterY)
end
if #tostring(items[5]>0) then
id = getitem(5)
invitem5= display.newImage (inventory,id..".png", display.contentCenterX,display.contentCenterY)
end
if #tostring(items[6]>0) then
id = getitem(6)
invitem6= display.newImage (inventory,id..".png", display.contentCenterX+65,display.contentCenterY)
end
if #tostring(items[7]>0) then
id = getitem(7)
invitem7= display.newImage (inventory,id..".png", display.contentCenterX-65,display.contentCenterY+65)
end
if #tostring(items[8]>0) then
id = getitem(8)
invitem8= display.newImage (inventory,id..".png", display.contentCenterX,display.contentCenterY+65)
end
if #tostring(items[9]>0) then
id = getitem(9)
invitem9= display.newImage (inventory,id..".png", display.contentCenterX+65,display.contentCenterY+65)
end
function hideinventory()
	-- body
inventory.x=1000
end
closeinv:addEventListener( "tap", hideinventory )
end
invbutton:addEventListener( "tap", showinventory )