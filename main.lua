local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local webhookUrl = "il tuo webhook" 

Players.PlayerAdded:Connect(function(player)
	local profileUrl = "https://www.roblox.com/users/" .. player.UserId .. "/profile"
	local data = {
		["content"] = "Player joined\nUsername: **" .. player.Name .. "**\nProfilo Roblox: <" .. profileUrl .. ">"
	}
	local jsonData = HttpService:JSONEncode(data)

	local success, err = pcall(function()
		HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
	end)
	if not success then
		warn("errore nell'invio del messaggio:", err)
	end
end)
