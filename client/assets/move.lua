function move(obj,movex,movey)
if obj==nil or movex==nil or movey==nil then
print ("Getting old")
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
movey=movey-1
end
if movey>0 or movex>0 then
tt[1]=obj
tt[2]=movex
tt[3]=movey
timer.performWithDelay( 15, move)
end
end