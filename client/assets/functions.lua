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
require ("assets.move")
require ("assets.npcs")
_G.id = math.random (1,1000)
_G.sprite="char2"
Background = display.newGroup()  
objects = display.newGroup()  --this will overlay 'farBackground'  
interface = display.newGroup()  --and this will overlay 'nearBackground'
_G.location="map0"
coords = display.newText("Hello World!", 100, 200, native.systemFont, 16 )
players={}
-- Battle stats
myhp=100
mydef=1
myatk=1
--
timers={}
chatcreate()
playergroup=display.newGroup()
readsprite()
print (sprite)
if sprite==nil then
sprite="char"
end
nickname="none"
character = display.newImage (interface,"assets/characters/"..sprite..".png" ,display.contentCenterX , display.contentCenterY)
idtext = display.newText(id, 5000, display.contentHeight, native.systemFont, 16 )
hptext = display.newText("HP: "..myhp, display.contentWidth-30, display.contentHeight, native.systemFont, 16 )
downbutton = display.newImage (interface,"assets/gui/down.png" , display.contentCenterX , display.contentHeight)
upbutton = display.newImage (interface,"assets/gui/up.png" , downbutton.x, downbutton.y-64)
leftbutton = display.newImage (interface,"assets/gui/left.png" , downbutton.x-64 , downbutton.y)
rightbutton = display.newImage (interface,"assets/gui/right.png" , downbutton.x+64 , downbutton.y)
_G.inventory = display.newImage (interface,"assets/gui/inventory.png",  32, display.contentHeight-5)
upbutton:addEventListener( "tap", goup )
downbutton:addEventListener( "tap", godown )
leftbutton:addEventListener( "tap", goleft )
rightbutton:addEventListener( "tap", goright )
npcs={}
pnick={}
end

	function goup()
		blockcheck(0,-1)
		tpcheck(0,-1)
		 battlecheck(0,-1)
		 dialcheck (0,-1)
map.y=map.y+32
go(0,32)
	-- player.y=player.y+32

	reload()
end
function godown()
blockcheck(0,1)
tpcheck(0,1)
battlecheck(0,1)
dialcheck (0,1)
map.y=map.y-32
go(0,-32)
	reload()
end
function goleft()
	blockcheck(-1,0)
	tpcheck(-1,0)
	battlecheck(-1,0)
	dialcheck (-1,0)
map.x=map.x+32
go(32,0)
	-- player.x=player.x+32
	reload()
end

function goright()
	blockcheck(1,0)
	tpcheck(1,0)
	battlecheck(1,0)
	dialcheck (1,0)
map.x=map.x-32
go(-32,0)
	-- player.x=player.x-32
	reload()
end

function writesprite(sprite)
-- Data (string) to write
local saveData = sprite

-- Path for the file to write
local path = system.pathForFile( "spriteconf.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "w" )

if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
print ("File written")
    -- Write data to file
    file:write( saveData )
    -- Close the file handle
    io.close( file )
end

file = nil
end

function readsprite()
-- Path for the file to read
local path = system.pathForFile( "spriteconf.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )

if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    print( "Contents of " .. path .. "\n" .. contents )
    -- Close the file handle
	sprite=contents
    io.close( file )
end

file = nil
end

function hpreload()
hptext.text="HP: "..myhp
end