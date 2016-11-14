function battle (mob)
if killed[mob]==nil then
if mob~=nil then
if myhp>0 then
myhp = myhp - mobstats[mob][2]
end
mobstats[mob][1] = mobstats[mob][1]-myatk
print (mobstats[mob][1])
		if myhp<=0 then
		lose()
  elseif mobstats[mob][1]<=0 and mobstats[mob][1] > -1000 then
			chatprint("Вы убили монстра!")
			killed[mob]=true
			mobstats[mob][1]=-1000
				print ("Winner 1")
				exp()
			end
if myhp>0 and mobstats[mob][1]>0 then
			timer.performWithDelay( 500, nextstep)
	end
	end
	end
end

function nextstep()
mobcheck(0,0)
	hpreload()
end

function lose()
level=0
writelevel()
	print ("Winner 2")
 chatprint("You died")
end

function exp()
xp=xp+10
end


function changemoney(summ)
mymoney=mymoney+summ
writemoney(mymoney)
hpreload()
end

function mobrespawn ()
kk=kk+1
if kk==5 then
kk=0
killed={}
end
end