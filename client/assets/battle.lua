function battle (mob)
if mob~=nil then
myhp = myhp - mobstats[mob][2]
mobstats[mob][1] = mobstats[mob][1]-myatk
print (mobstats[mob][1])
		if myhp<=0 then
		lose()
  elseif mobstats[mob][1]<=0 and mobstats[mob][1] > -1000 then
			chatprint("Вы убили монстра!")
			mobstats[mob][1]=-1000
				print ("Winner 1")
				exp()
			end
if myhp>0 and mobstats[mob][1]>0 then
			timer.performWithDelay( 500, nextstep)
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