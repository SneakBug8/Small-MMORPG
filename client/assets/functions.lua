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
sprite="char2"
Background = display.newGroup()  
objects = display.newGroup()  --this will overlay 'farBackground'  
interface = display.newGroup()  --and this will overlay 'nearBackground'
_G.location="map0"
coords = display.newText("Hello World!", 100, 200, native.systemFont, 16 )
players={}
timers={}
chatcreate()
playergroup=display.newGroup()
character = display.newImage (interface,"assets/characters/char.png" ,display.contentCenterX , display.contentCenterY)
idtext = display.newText(id, display.contentCenterX, 0, native.systemFont, 16 )
downbutton = display.newImage (interface,"assets/gui/down.png" , display.contentCenterX , display.contentHeight)
upbutton = display.newImage (interface,"assets/gui/up.png" , downbutton.x, downbutton.y-64)
leftbutton = display.newImage (interface,"assets/gui/left.png" , downbutton.x-64 , downbutton.y)
rightbutton = display.newImage (interface,"assets/gui/right.png" , downbutton.x+64 , downbutton.y)
_G.inventory = display.newImage (interface,"assets/gui/inventory.png",  32, display.contentHeight-5)
upbutton:addEventListener( "tap", goup )
downbutton:addEventListener( "tap", godown )
leftbutton:addEventListener( "tap", goleft )
rightbutton:addEventListener( "tap", goright )
end


	function goup()
		blockcheck(0,-1)
		tpcheck(0,-1)
map.y=map.y+32
	-- player.y=player.y+32

	reload()
end
function godown()
blockcheck(0,1)
tpcheck(0,1)
map.y=map.y-32
	reload()
end
function goleft()
	blockcheck(-1,0)
	tpcheck(-1,0)
map.x=map.x+32
	-- player.x=player.x+32
	reload()
end

function goright()
	blockcheck(1,0)
	tpcheck(1,0)
map.x=map.x-32
	-- player.x=player.x-32
	reload()
end