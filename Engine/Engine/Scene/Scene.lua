require "Engine/Map/MapManager"

Scene = Object:extend()

function Scene:new()
  lstSprite = {}
end

function Scene:Init()
  mapManager = MapManager()
end

function Scene:UnLoad()
  lstSprite = {}
end

function Scene:Update(dt)
  -- Update Sprite
  for i = #lstSprite, 1, -1 do
    lstSprite[i]:Update(dt)
    if lstSprite[i].toRemove then
      table.remove(lstSprite, i)
    end
  end
  
end

function Scene:Draw()
  -- Draw Sprite
  for i = #lstSprite, 1, -1 do
    lstSprite[i]:Draw()
  end
  
end
