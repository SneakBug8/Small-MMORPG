function invinit()
items={}
items[1]="-"
items[2]="-"
items[3]="-"
items[4]="-"
items[5]="-"
items[6]="-"
items[7]="-"
items[8]="-"
items[9]="-"
for i=1,5 do
slots[i]="-"
end
iis=0
invtexts={}
for i=1,9 do
getitem(i)
invtexts[i]= display.newText(items[i], 1000, chatinput.y+i*30, native.systemFont, 16 )
end
for i=1,5 do
slotstexts[i]=display.newText(slots[i], 1000, chatinput.y+i*30, native.systemFont, 16 )
end
invback = display.newImage (interface,"assets/gui/invback.png" , 1000 , display.contentCenterY)
end

function showinventory()
for i=1,9 do
--getitem(i)
invtexts[i].x=50
end
for i=1,5 do
slotstexts[i].x=150
end
invback.x = display.contentCenterX
end

function hideinventory()
for i=1,9 do
--getitem(i)
invtexts[i].x=1000
end
for i=1,5 do
slotstexts[i].x=1000
end
invback.x = 1000
end

function getitem(num)
-- Path for the file to read
local path = system.pathForFile( "item"..num..".txt", system.DocumentsDirectory )

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
    if contents~=nil then
	items[num]=contents
    end
    io.close( file )
end
end

function changeitem (num,const)
invtexts[num].text=const
items[num]=const
writeitem(num)
end

function equipitem()
end

function writeitem(num)
local saveData = items[num]

-- Path for the file to write
local path = system.pathForFile( "item"..num..".txt", system.DocumentsDirectory )

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