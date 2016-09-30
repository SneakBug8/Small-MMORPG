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
require ("assets.stats")
require ("assets.inventory")
_G.id = math.random (1,1000)
_G.sprite="char2"
_G.slotstexts={}
_G.str=0
_G.agy=0
_G.int=0
slots={}
Background = display.newGroup()  
objects = display.newGroup()  --this will overlay 'farBackground'  
playergroup=display.newGroup()
interface = display.newGroup()  --and this will overlay 'nearBackground'
_G.location="map0"
coords = display.newText(playergroup,"Hello World!", 100, 200, native.systemFont, 16 )
players={}
-- Battle stats
myhp=100
mydef=1
myatk=1
_G.mymoney=100
level=1
xp=100
readmoney()
--
tt={}
timers={}
chatcreate()
readsprite()
if sprite==nil then
sprite="char"
end
nickname="none"
character = display.newImage (interface,"assets/characters/"..sprite..".png" ,display.contentCenterX , display.contentCenterY)
idtext = display.newText(id, 5000, display.contentHeight, native.systemFont, 16 )
hptext = display.newText("HP: "..myhp, display.contentWidth-30, display.contentHeight, native.systemFont, 16 )
moneytext = display.newText("Gold: "..mymoney, display.contentWidth-50, chatinput.y+20, native.systemFont, 16 )
leveltext = display.newText("XP: "..xp.." Level: "..level, 100, chatinput.y+20, native.systemFont, 16 )
downbutton = display.newImage (interface,"assets/gui/down.png" , display.contentCenterX-50 , display.contentHeight-15)
upbutton = display.newImage (interface,"assets/gui/up.png" , downbutton.x, downbutton.y-64*2)
leftbutton = display.newImage (interface,"assets/gui/left.png" , downbutton.x-64 , downbutton.y-64)
rightbutton = display.newImage (interface,"assets/gui/right.png" , downbutton.x+64 , downbutton.y-64)
_G.inventory = display.newImage (interface,"assets/gui/inventory.png",  downbutton.x, downbutton.y-64)
upbutton:addEventListener( "tap", goup )
downbutton:addEventListener( "tap", godown )
leftbutton:addEventListener( "tap", goleft )
rightbutton:addEventListener( "tap", goright )
npcs={}
pnick={}
mobstats={}
mobhp={}
items={}
invinit()
slots={1,2,3}
readlevel()
end

	function goup()
	mobcheck(0,-1)
		blockcheck(0,-1)
		tpcheck(0,-1)
		 dialcheck (0,-1)
map.y=map.y+32
go(0,32)
	-- player.y=player.y+32

	reload()
end
function godown()
mobcheck(0,1)
blockcheck(0,1)
tpcheck(0,1)
dialcheck (0,1)
map.y=map.y-32
go(0,-32)
	reload()
end
function goleft()
mobcheck(-1,0)
blockcheck(-1,0)
	tpcheck(-1,0)
	dialcheck (-1,0)
map.x=map.x+32
go(32,0)
	-- player.x=player.x+32
	reload()
end

function goright()
mobcheck(1,0)
	blockcheck(1,0)
	tpcheck(1,0)
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
moneytext.text="Gold: "..mymoney
leveltext.text="XP: "..xp.." Level: "..level
end


function writemoney(sprite)
-- Data (string) to write
local saveData = sprite

-- Path for the file to write
local path = system.pathForFile( "moneyconf.txt", system.DocumentsDirectory )

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

function readmoney()
-- Path for the file to read
local path = system.pathForFile( "moneyconf.txt", system.DocumentsDirectory )

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
	mymoney=contents
    io.close( file )
end

file = nil
end


function writelevel()
-- Data (string) to write
local saveData = level

-- Path for the file to write
local path = system.pathForFile( "levelconf.txt", system.DocumentsDirectory )

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
    writexp()
    io.close( file )
end

file = nil
end

function readlevel()
-- Path for the file to read
local path = system.pathForFile( "levelconf.txt", system.DocumentsDirectory )

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
	level=tonumber(contents)
    readxp()
    io.close( file )
end

file = nil
end

function writexp()
-- Data (string) to write
local saveData = xp

-- Path for the file to write
local path = system.pathForFile( "xpconf.txt", system.DocumentsDirectory )

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

function readxp()
-- Path for the file to read
local path = system.pathForFile( "xpconf.txt", system.DocumentsDirectory )

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
	xp=tonumber(contents)
    io.close( file )
end

file = nil
end