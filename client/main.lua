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
local composer = require( "composer" )
local widget = require( "widget" )
-- mui

local scene = composer.newScene()
local weapon={"Деревянный меч",1}
local armor={"Одежда",1}
local money="100"
local needup = 0
local needdown = 0
local needleft = 0
local needright = 0
local scene  = display.newGroup()
local controls = display.newGroup()
local inventory = display.newGroup()
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

local send = display.newImage (controls,"send.png" ,display.contentCenterX+135, 0)

local mycloud = display.newText("", character.x, character.y-25, native.systemFont, 16 )
local hiscloud = display.newText("", player.x, player.y-25, native.systemFont, 16 )
local chatinput = native.newTextField(display.contentCenterX, display.contentCenterY, 250, 25)
chatinput.anchorX=0.5
chatinput.anchorY=0.5
chatinput.x = display.contentCenterX-25
chatinput.y=0
chatinput.height=25
local packet={}
local x=0

local sheetOptions =
{
    width = 32,
    height = 32,
    numFrames = 96
}
local charsheet = graphics.newImageSheet( "char1.png", sheetOptions )
local charsequence = {
    -- consecutive frames sequence
    {
        name = "walk",
        start = 1,
        count = 3,
        time = 800,
        loopCount = 0,
        loopDirection = "forward"
    }
}

function sendchat()
notify(chatinput.text)
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
checkloot()
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

function showinventory()
	inventory.x=0
invbackground = display.newImage (inventory,"invbackground.png" ,display.contentCenterX , display.contentCenterY)
local stats = display.newText(inventory,"ATK: "..weapon[2].." DEF: "..armor[2],display.contentCenterX, display.contentCenterY-80, native.systemFont, 24)
local weapontext = display.newText(inventory,"Оружие: "..weapon[1].." ATK:"..weapon[2], display.contentCenterX, display.contentCenterY, native.systemFont, 16 )
local armortext = display.newText(inventory,"Броня: "..armor[1].." DEF: "..armor[2], display.contentCenterX , display.contentCenterY+64, native.systemFont, 16 )
local moneytext = display.newText(inventory,"Золото: "..money, display.contentCenterX , display.contentCenterY+128, native.systemFont, 16 )

local closeinv = display.newImage (inventory,"closeinv.png" , display.contentWidth-32, 15)
function hideinventory()
	-- body
inventory.x=1000
end
closeinv:addEventListener( "tap", hideinventory )
end
invbutton:addEventListener( "tap", showinventory )
function checkloot()
	-- body
	if coordx==15 and coordy==15 then
		addarmor("Доспех",2)
	end
end

function addarmor(name, def)
	-- body
armor[1]=name
armor[2]=def
notify("Подобрано: "..armor[1].." DEF: "..armor[2])
end

function addweapon(name, atk)
	-- body
	weapon[1]=name
	weapon[2]=atk
end

function addmoney(count)
	-- body
	money=money+count
end

function notify (text)
	mycloud.text=text
	timer.performWithDelay( 2000, removecloud, 1 )
end