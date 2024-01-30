local teleportService = game:GetService("TeleportService")

local placeID = 12313172310

local currentPlaceID = game.PlaceId


if currentPlaceID ~= placeID then
    
    teleportService:Teleport(placeID)
else
    

loadstring(game:HttpGet("https://raw.githubusercontent.com/Bshsvsvhsgs/Fun-guis/main/Cimulator%20Padenia%20B%20KaHady.lua.txt"))()
