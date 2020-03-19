AssetManager = {}

AssetManager.player = {}
AssetManager.player.idle = love.graphics.newImage("Content/Player_Idle.png")
AssetManager.player.run = love.graphics.newImage("Content/Player_Running.png")

AssetManager.tileSetMap = love.graphics.newImage("Content/Map/TileSetMap.png")

Debug:Log("AssetManager chargé !")

return AssetManager