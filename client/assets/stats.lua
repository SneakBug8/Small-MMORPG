function levelcheck()
if xp>level*100 then
xp=xp-level*100
level=level+1
end
writelevel()
reloadstats()
-- readstats()
end

function reloadstats()
recountstats()
myatk=level+stats
end

function recountstats()
stats = slots[1]
end

--[[
stats[1] - оружие
stats[2] - броня
stats[3] - шлем
stats[4] - штаны
stats[5] - ботинки
]]--

function readstats()
answer={}
network.request( "http://sneakbug8.github.io/mmonet/characters/esmond/str.html", "GET", readnet )
str=answer[1]
network.request( "http://sneakbug8.github.io/mmonet/characters/esmond/agy.html", "GET", readnet )
agy=answer[2]
network.request( "http://sneakbug8.github.io/mmonet/characters/esmond/int.html", "GET", readnet )
int=answer[3]
-- print (str..agy..int)
end


function readnet( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
		answer[#answer]=event.response
    end
end


function checkstats ()
if nickname==nil then
elseif nickname=="esmond" then
str=1
agy=1
int=1
end
print (str..agy..int)
end