function move(obj,movex,movey)
if obj==nil or movex==nil or movey==nil then
obj=tt[1]
movex=tt[2]
movey=tt[3]
end
if movex>0 then
_G[obj].x=_G[obj].x+1
movex=movex-1
end
if movey>0 then
_G[obj].y=_G[obj].y+1
movex=movey-1
end
if movey>0 and movex>0 then
tt={obj,movex,movey}
end
timer.performWithDelay( 15, move)
end