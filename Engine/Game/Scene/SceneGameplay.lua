SceneGameplay = Scene:extend()

function SceneGameplay:new()
  
  self.super.new(self)
end


function SceneGameplay:Init()
  self.super.Init(self)
  
  mapManager:AddMap("Floor1", require "Content/Map/Floor1", AssetManager.tileSetMap)
  mapManager:LoadMap("Floor1")
  
  player = Player(100, 64)
  table.insert(lstSprite, player)
end


function SceneGameplay:UnLoad()
  
  self.super.UnLoad(self)
end


function SceneGameplay:Update(dt)
  --Player Move
  moving = false
  if love.keyboard.isDown(Key.up) then
    player.vy = -player.speed * dt;
    player:PlayAnim("Run")
    moving = true
  end
  if love.keyboard.isDown(Key.down) then
    player.vy = player.speed * dt;
    player:PlayAnim("Run")
    moving = true
  end
  if love.keyboard.isDown(Key.right) then
    player.vx = player.speed * dt;
    player:PlayAnim("Run")
    moving = true
    player.flip = false
  end
  if love.keyboard.isDown(Key.left) then
    player.vx = -player.speed * dt;
    player:PlayAnim("Run")
    moving = true
    player.flip = true
  end
  if moving then 
    player:PlayAnim("Run")
  else
    player:PlayAnim("Idle")
  end
  
  self.super.Update(self, dt)
  
  Camera:SetCenter(player.x, player.y)
end


function SceneGameplay:Draw()
  mapManager:Draw()
  
  self.super.Draw(self)
end
