--[[
	@sending - сообщение формата nickname: message
	@message - полный пакет данных
]]--
function chatcreate ()
chatbox = native.newTextBox( display.contentCenterX-25,0, 270, 70 )
chatinput = native.newTextField( display.contentCenterX, chatbox.y+45,display.contentWidth,20 )
sendbutton = display.newImage ("assets/gui/sendchat.png",  display.contentWidth-18, chatbox.y)
sendbutton:addEventListener( "tap", sendpress)
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
if string.match (sending,"/roll") then
rollmodif(sending)
end

if sending~=nil and sending~="" then
	print ("Chat sent")
hub:publish({
		message = {
			nickname=nickname,
			id=id,
			type="chat",
			location=location,
			coordx = coordx,
			coordy = coordy,
			chat = sending }
		})
end
else
login=1
nickname=sending
print (nickname)
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