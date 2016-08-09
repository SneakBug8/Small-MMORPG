-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
print ("Game started")
crypto = require("crypto")
require("noobhub")
local id = math.random(0,100)
local map = display.newImage ("map1.png",  display.contentCenterX+16, display.contentCenterY+16)
-- local layer2 = display.newImage (map, "layer2.png")
local character = display.newImage ("char.png" ,display.contentCenterX , display.contentCenterY)
local player = display.newImage ("char.png",1000,1000)
local upbutton = display.newImage ("up.png" , 165, 320)
local downbutton = display.newImage ("down.png" , upbutton.x , upbutton.y+64)
local leftbutton = display.newImage ("left.png" , upbutton.x-64 , upbutton.y+64)
local rightbutton = display.newImage ("right.png" , upbutton.x+64 , upbutton.y+64)

local coords = display.newText( "Hello World!", 100, 200, native.systemFont, 16 )
local menu = display.newImage ("menu.jpg" ,display.contentCenterX , display.contentCenterY)

local chat = native.newTextBox( display.contentCenterX, display.contentCenterY, 300, 75 )
local chatinput = native.newTextField( display.contentCenterX, display.contentCenterY, 250, 25 )
local send = display.newImage ("send.png" ,display.contentCenterX+135, display.contentCenterY+275)

chat.anchorX=0.5
chat.anchorY=0.5
chatinput.anchorX=0.5
chatinput.anchorY=0.5
chat.x=display.contentCenterX
chat.y=display.contentCenterY+220
chatinput.x = display.contentCenterX-25
chatinput.y=display.contentCenterY+275
local packet={}
function sendchat()
local packet={}
packet[1]=0
packet[2]="chat"
packet[5]=chatinput.text
hub:publish({
		message = {
			action  =  packet,
			timestamp = system.getTimer()
		}
		})
chatinput.text=""
end
send:addEventListener( "tap", sendchat )
function reload ()
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
	map.y=map.y+32
	player.y=player.y+32
	reload()
end
upbutton:addEventListener( "tap", goup )
function godown()
	map.y=map.y-32
	player.y=player.y-32
	reload()
end
downbutton:addEventListener( "tap", godown )
function goleft()
	map.x=map.x+32
	player.x=player.x+32
	reload()
end
leftbutton:addEventListener( "tap", goleft )
function goright()
	map.x=map.x-32
	player.x=player.x-32
	reload()
end
rightbutton:addEventListener( "tap", goright )
function reader(message)
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
chat.text = chat.text.."\n"..message.action[5]
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