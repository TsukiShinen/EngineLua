require "Engine/Map/Map"

MapManager = Object:extend()


function MapManager:new()
  self.lstMap = {}
  self.lstMapName = {}
  self.currentMap = ""
end


function MapManager:AddMap(pMapName, pMap, pTexture)
  -- Vérifie si la map est deja charger
  mapExist = false
  for k,v in pairs(self.lstMapName) do 
    if v == pMapName then
      mapExist = true
      Debug:Error("Map "..pMapName.." est déja charger")
    end
  end
  
  if mapExist == false then
    self.lstMap[pMapName] = Map(pMap, pTexture)
    table.insert(self.lstMapName, pMapName)
  end
end


function MapManager:LoadMap(pMapName)
  mapExist = false
  for k,v in pairs(self.lstMapName) do 
    if v == pMapName then
      mapExist = true
    end
  end
  
  if mapExist then
    self.currentMap = pMapName
    Debug:Log("Changement de Map : "..pMapName)
  else
      Debug:Error("LoadMap : "..pMapName.." n'est pas une map enregistrer")
  end
end


function MapManager:IsOnMap(pX, pY)
  map = self.lstMap[self.currentMap]
  return pX >= 0 and pX < map.widht * map.tileWidth and pY >= 0 and pY < map.height * map.tileHeight
end


function MapManager:GetTileCoordonate(pX, pY)
  map = self.lstMap[self.currentMap]
  if self:IsOnMap(pX, pY) then
    coord = {}
    coord.x = math.floor(pX / map.tileWidth) + 1
    coord.y = math.floor(pY / map.tileHeight) + 1
    return coord
  else
    Debug:Error("Element hors de la Map")
    return nil
  end
end


function MapManager:DetectProperties(pProp, pX, pY)
  map = self.lstMap[self.currentMap]
  coord = self:GetTileCoordonate(pX, pY)
  if coord ~= nil then
    for k,v in pairs(map.lstLayer) do
      layer = v
      id = layer.data[coord.x + (coord.y-1) * layer.width]
      
      tile = map.tileSet.tiles[id]
      
      for i = 0, #tile.properties do
        prop = tile.properties[pProp]
        if prop ~= nil then
          if prop == true then
            return true
          end
        end
      end
    end
  end
  return false
end


function MapManager:Draw()
  if self.currentMap ~= "" then
    self.lstMap[self.currentMap]:Draw()
  end
end
