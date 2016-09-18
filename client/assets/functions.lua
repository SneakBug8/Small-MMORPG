function checkexit (message,timers)
if timers[message.nickname]+60<system.getTimer() then
print ("Deleting player")
players[message.nickname]=nil
end
end
function init()
print ("Game started")
crypto = require("crypto")
composer = require( "composer" )
require("noobhub")
require ("assets.battle")
require ("assets.chat")
_G.id = math.random (1,1000)

Background = display.newGroup()  
objects = display.newGroup()  --this will overlay 'farBackground'  
interface = display.newGroup()  --and this will overlay 'nearBackground'
_G.location="map0"
coords = display.newText("Hello World!", 100, 200, native.systemFont, 16 )
players={}
timers={}
playergroup=display.newGroup()
character = display.newImage ("assets/characters/char.png" ,display.contentCenterX , display.contentCenterY)
idtext = display.newText(id, display.contentCenterX, 0, native.systemFont, 16 )
upbutton = display.newImage ("assets/gui/up.png" , display.contentCenterX, display.contentHeight-75)
downbutton = display.newImage ("assets/gui/down.png" , upbutton.x , upbutton.y+64)
leftbutton = display.newImage ("assets/gui/left.png" , upbutton.x-64 , upbutton.y+64)
rightbutton = display.newImage ("assets/gui/right.png" , upbutton.x+64 , upbutton.y+64)
_G.inventory = display.newImage ("assets/gui/inventory.png",  display.contentWidth-32, 5)
end