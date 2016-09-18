--[[
	@sending - сообщение формата nickname: message
	@message - полный пакет данных
]]--
function chatinit (message)
-- Вызов при получении сообщении чата
	if string.match (message.chat,"/") then
chatcheck(message)
else
	chatbox.text=chatbox.text.."\n"..message.nickname..": "..message.chat
end
end

function chatprint (what)
-- Простой принт в чат
chatbox.text=chatbox.text.."\n"..what
end

function chatsend(sending)
	-- Output проверка.
if string.match (sending,"/try") then
trymodif(sending)
end
if string.match (sending,"/roll") then
rollmodif(sending)
end

if sending~=nil and sending~="" then
	print ("Chat sent")
hub:publish({
		message = {
			nickname=id,
			type="chat",
			location=location,
			coordx = coordx,
			coordy = coordy,
			chat = sending }
		})
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