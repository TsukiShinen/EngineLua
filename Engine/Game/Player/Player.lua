Player = Sprite:extend()

function Player:new(pX, pY)
  -- Sprite
  self.super.new(self, AssetManager.player.idle, pX, pY)
  
  -- Set Anim
  self:AddAnim("Idle", AssetManager.player.idle, 3, 16, 16, 0.25)
  self:AddAnim("Run", AssetManager.player.run, 4, 16, 16, 0.25)
  self:PlayAnim("Idle")
  
  -- Player
  self.speed = 50;
end

function Player:Update(dt)
  
  self.super.Update(self, dt)
end

function Player:Draw(dt)
  
  self.super.Draw(self, dt)
end