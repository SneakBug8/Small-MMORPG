--[[
	@sending - сообщение формата nickname: message
	@message - полный пакет данных
]]--
function chatcreate ()
chatbox = native.newTextBox( display.contentCenterX-25,35, 270, 70 )
chatinput = native.newTextField( display.contentCenterX, chatbox.y+45,display.contentWidth,20 )
-- sendbutton = display.newImage ("assets/gui/sendchat.png",  display.contentWidth-20, chatbox.y)
sendbutton = widget.newButton(
    {
        label = "Send",
		labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = sendpress,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 64,
        height = 64,
        cornerRadius = 2,
        fillColor = { default={0.5,0.5,0.5,1}, over={0.5,0.5,0.5,0.5} },
    }
)

-- Center the button
sendbutton.x = display.contentWidth-20
sendbutton.y = chatbox.y
end
function chatinit (message)
-- Вызов при получении сообщении чата
	if string.match (message.chat,"/") then
chatcheck(message)
else
chatbox.text=message.nickname..": "..message.chat.."\n"..chatbox.text
end
end

function chatprint (what)
-- Простой принт в чат
chatbox.text=what.."\n"..chatbox.text
end

function chatsend(sending)
	-- Output проверка.
if login==1 then
if string.match (sending,"/try") then
trymodif(sending)
end
if string.match (sending,"/sprite") then
spritemodif(sending)
end
if string.match (sending,"/who") then
whomodif(sending)
end
if string.match (sending,"/roll") then
rollmodif(sending)
end
if string.match (sending,"/dice") then
dicemodif(sending)
end
if string.match (sending,"/cheat666") then
changemoney(666)
changeitem (1,"100 @ lil")
xp=xp+666
hpreload()
end
if sending~=nil and sending~="" then
	print ("Chat sent")
hub:publish({
		message = {
			nickname=nickname,
			id=id,
			type="chat",
			location=location,
			suff=suff,
			coordx = coordx,
			coordy = coordy,
			chat = sending }
		})
end
else
login=1
nickname=sending
print (nickname)
getsuff()
checkstats ()
goto("map0")
end
end
 function outputchatcheck(sending)
 	-- body
 end
function chatcheck(message)
	-- Input проверка команд
	print ("Checking chat")
	if string.match (message.chat,"/attack") then
	elseif string.match (message.chat,"/me") then
	 message.chat = string.sub(message.chat, 5)
	 chatprint (message.nickname.." "..message.chat)
	 elseif string.match (message.chat,"/do") then
	 message.chat = string.sub(message.chat, 5)
	 chatprint (message.chat.." ("..message.nickname..")")
	 elseif string.match (message.chat,"/setname") then
name= string.sub(message.chat, 9)
 elseif string.match (message.chat,"/delme") then
display.remove(players[message.id])
display.remove(pnick[message.id])
players[message.id]=nil
	else

	end

end

function trymodif (sending)
sending = string.sub(sending, 6)
lol = math.random(1,2)
if lol==1 then
add = "(Не получилось)"
elseif lol==2 then
add = "(Получилось)"
end
chatsend(sending.." "..add)
end

function rollmodif (sending)
lol = math.random(1,6)
chatsend ("выбросил "..lol)
end

function spritemodif(sending)
sending = string.sub(sending, 9)
sprite = sending
print ("Sprite "..id.." "..sprite)
writesprite(sprite)
chatsend ("/delme")
end

function sendpress()
chatsend(chatinput.text)
chatinput.text=""
	-- body
end

function dicemodif(sending)
if string.match (sending,"str") then
lol = math.random(str,6)
add="на атаку"
elseif string.match (sending,"agy") then
lol = math.random(agy,6)
add="на ловкость"
elseif string.match (sending,"int") then
lol = math.random(int,6)
add="на разум"
end
chatsend ("выбросил "..lol.." "..add)
end 

function whomodif(sending)
pp=0
for i=1,1000 do
if players[i]~=nil then
pp=pp+1
end
end
chatprint(pp.." players online")
end
