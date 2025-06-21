local placeId = game.PlaceId
local gameId = game.GameId

print("PlaceId:", placeId)
print("GameId:", gameId)

-- You can detect a specific game like this:
if placeId == 116495829188952 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/34b20c9e914c2615f025a8cb6f434cb7.lua"))()
elseif placeId == 126884695634066 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a8f02a61fc38bf9256dd0f17be6b16d7.lua"))()
elseif placeId == 2753915549 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b2db2af40b53ef0a502f6d561b4c6449.lua"))()
elseif placeId == 17625359962 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c8c09494b048a1fc6a4dc43bec1f3713.lua"))()
elseif placeId == 85896571713843 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/588c84c135c213eb9badde611f08be9b.lua"))()
else
    warn("Ronix hub doesnt have this game.")
    print("here is a list of all the games it supports: dead rails, grow a graden, blox fruits, rivals, and Bubble Gum Simulator INFINITY")
end
