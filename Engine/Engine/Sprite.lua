-- Util :
-- Sprite:new(pDirTexture, pX, pY)
-- Sprite:AddAnim(pAnimName, pDirTexture, pNbr, pSizeX, pSizeY, pSpeed)
-- Sprite:PlayAnim(pAnimName)
-- Sprite:Move(pX, pY)



Sprite = Object:extend()


function Sprite:new(pTexture, pX, pY)
  self.texture = pTexture
  self.x = pX
  self.y = pY
  self.vx = 0
  self.vy = 0
  self.frictionX = 99
  self.frictionY = 99
  self.toRemove = false
  self.enableCollision = true
  
  self.scale = 1
  self.rotation = 0
  self.flip = false
  
  self.currentAnim = ""
  self.lstAnim = {}
  self.lstAnimName = {}
end


function Sprite:AddAnim(pAnimName, pTexture, pNbr, pSizeX, pSizeY, pSpeed)
  self.lstAnim[pAnimName] = CreaAnim(pTexture, pNbr, pSizeX, pSizeY, pSpeed)
  table.insert(self.lstAnimName, pAnimName)
end


function Sprite:PlayAnim(pAnimName)
  find = false
  
  for k,v in pairs(self.lstAnimName) do
    if pAnimName == v then
        find = true
      if self.currentAnim ~= pAnimName then
        self.currentAnim = pAnimName
        self.lstAnim[pAnimName].frame = 1
      end
    end
  end
  
  if find == false then Debug:Error("AnimName : "..pAnimName.." is not a Anim") end
end


function Sprite:UpdateAnim(dt)
  if self.currentAnim ~= "" then
    -- Timer
    self.lstAnim[self.currentAnim].timer = self.lstAnim[self.currentAnim].timer - dt
    -- Change Frame when timer finish
    if self.lstAnim[self.currentAnim].timer <= 0 then
      self.lstAnim[self.currentAnim].frame = self.lstAnim[self.currentAnim].frame + 1
      self.lstAnim[self.currentAnim].timer = self.lstAnim[self.currentAnim].speed
      -- Reset Frame
      if self.lstAnim[self.currentAnim].frame > self.lstAnim[self.currentAnim].nbrFrame then
        self.lstAnim[self.currentAnim].frame = 1
      end
    end
  end
end


function Sprite:CollideUp(pProp)
  id1x = self.x + 1
  id1y = self.y-1
  id2x = self.x + self.lstAnim[self.currentAnim].width-2
  id2y = self.y-1
  if mapManager:DetectProperties(pProp, id1x, id1y) or mapManager:DetectProperties(pProp, id2x, id2y) then return true end
  return false
end


function Sprite:CollideDown(pProp)
  id1x = self.x + 1
  id1y = self.y + self.lstAnim[self.currentAnim].height
  id2x = self.x + self.lstAnim[self.currentAnim].width-2
  id2y = self.y + self.lstAnim[self.currentAnim].height
  if mapManager:DetectProperties(pProp, id1x, id1y) or mapManager:DetectProperties(pProp, id2x, id2y) then return true end
  return false
end


function Sprite:CollideRight(pProp)
  id1x = self.x + self.lstAnim[self.currentAnim].width
  id1y = self.y + 3  
  id2x = self.x + self.lstAnim[self.currentAnim].width
  id2y = self.y + self.lstAnim[self.currentAnim].height - 2
  if mapManager:DetectProperties(pProp, id1x, id1y) or mapManager:DetectProperties(pProp, id2x, id2y) then return true end
  return false
end


function Sprite:CollideLeft(pProp)
  id1x = self.x-1
  id1y = self.y + 3
  id2x = self.x-1
  id2y = self.y + self.lstAnim[self.currentAnim].height - 2
  if mapManager:DetectProperties(pProp, id1x, id1y) or mapManager:DetectProperties(pProp, id2x, id2y) then return true end
  return false
end


function Sprite:Move(pX, pY)
  self.x = self.x + pX
  self.y = self.y + pY
end


function Sprite:Update(dt)
  -- Update Anim
  self:UpdateAnim(dt)
  
  -- Calculate the movement steps
  local distanceX = self.vx * dt
  local distanceY = self.vy * dt
  
  -- Avoid long jumps (to allow sprites collisions)
  if distanceX > self.lstAnim[self.currentAnim].width/2 then distanceX = self.lstAnim[self.currentAnim].width/2 end
  if distanceY > self.lstAnim[self.currentAnim].height/2 then distanceY = self.lstAnim[self.currentAnim].height/2 end
    
  -- Collision detection using simple and not optimized CCD
  
  -- Get the last internal collide result
  local collide = false

  -- Horizontal
  local destX = self.x + distanceX
  if distanceX > 0 and collide == false then
    while self.x < destX do
      collide = self:CollideRight("ISSOLID")
      if collide == true then
        self.vx = 0
        break
      else
        self.x = self.x + 0.05
      end
    end
  elseif distanceX < 0 and collide == false then
    while self.x > destX do
      collide = self:CollideLeft("ISSOLID")
      if collide == true then
        self.vx = 0
        break
      else
        self.x = self.x - 0.05
      end
    end
  end
  -- Veritcal
  local destY = self.y + distanceY
  if distanceY > 0 and collide == false then
    while self.y < destY do
      collide = self:CollideDown("ISSOLID")
      if collide == true then
        self.vy = 0
        break
      else
        self.y = self.y + 0.05
      end
    end
  elseif distanceY < 0 and collide == false then
    while self.y > destY do
      collide = self:CollideUp("ISSOLID")
      if collide == true then
        self.vy = 0
        break
      else
        self.y = self.y - 0.05
      end
    end
  end
  
  -- Move
  self:Move(self.vx, self.vy)
  
  -- Friction
  if self.vx > 0 then
    self.vx = self.vx - self.frictionX * dt
    if self.vx < 0 then self.vx = 0 end
  end
  if self.vx < 0 then
    self.vx = self.vx + self.frictionX * dt
    if self.vx > 0 then self.vx = 0 end
  end
  if self.vy > 0 then
    self.vy = self.vy - self.frictionY * dt
    if self.vy < 0 then self.vy = 0 end
  end
  if self.vy < 0 then
    self.vy = self.vy + self.frictionY * dt
    if self.vy > 0 then self.vy = 0 end
  end
end


function Sprite:Draw()
  if self.flip then
    if self.currentAnim ~= "" then
      local Anim = self.lstAnim[self.currentAnim]
      love.graphics.draw(Anim.texture, Anim.lstImages[Anim.frame], self.x + self.scale * Anim.width, self.y, self.rotation, -self.scale, self.scale)
    else  
      love.graphics.draw(self.texture, self.x + self.scale * Anim.width, self.y, self.rotation, -self.scale, self.scale)
    end
  else
    if self.currentAnim ~= "" then
      local Anim = self.lstAnim[self.currentAnim]
      love.graphics.draw(Anim.texture, Anim.lstImages[Anim.frame], self.x, self.y, self.rotation, self.scale, self.scale)
    else  
      love.graphics.draw(self.texture, self.x, self.y, self.rotation, self.scale, self.scale)
    end
  end
end


function CreaAnim(pTexture, pNbr, pSizeX, pSizeY, pSpeed)
  myAnim = {}
  myAnim.texture = pTexture
  myAnim.nbrFrame = pNbr
  myAnim.width = pSizeX
  myAnim.height = pSizeY
  
  -- Decoupe l'images
  myAnim.lstImages = {}
  x,y = 0,0
  for i = 1, pNbr do
    table.insert(myAnim.lstImages, love.graphics.newQuad(x,y,pSizeX, pSizeY, myAnim.texture:getDimensions()))
    x = x + pSizeX
    if x >= myAnim.texture:getWidth() then
      y = y + pSizeY
      x = 0
    end
  end
  
  myAnim.frame = 1
  myAnim.speed = pSpeed
  myAnim.timer = pSpeed
  return myAnim
end
