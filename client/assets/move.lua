function move(obj,movex,movey)
if movex>0 then
_G[obj].x=_G[obj].x+1
movex=movex-1
end
if movey>0 then
_G[obj].y=_G[obj].y+1
movey=movey-1
end
if movex>0 or movey>0 then
nextt(obj,movex,movey)
end
end

function nextt(obj,movex,movey)
timer.performWithDelay(1000, move(obj,movex,movey) )
end