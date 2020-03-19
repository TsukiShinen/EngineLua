camera = {}
camera.x = 0
camera.y = 0
camera.scaleX = 1
camera.scaleY = 1
camera.rotation = 0
camera.layers = {}

function camera:Set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.scale(self.scaleX, self.scaleY)
  love.graphics.translate(-self.x, -self.y)
end

function camera:Unset()
  love.graphics.pop()
end

function camera:Move(dx, dy)
  self.x = self.x + (dx or 0)
  self.y = self.y + (dy or 0)
end

function camera:Rotate(dr)
  self.rotation = self.rotation + dr
end

function camera:Scale(sx, sy)
  sx = sx or 1
  self.scaleX = self.scaleX * sx
  self.scaleY = self.scaleY * (sy or sx)
end

function camera:SetCenter(x, y)
  self.x = x - Screen.width/(2*Screen.scaleX) or self.x
  self.y = y - Screen.height/(2*Screen.scaleY) or self.y
end

function camera:SetPosition(x, y)
  self.x = x or self.x
  self.y = y or self.y
end

function camera:MousePosition()
  return love.mouse.getX() * self.scaleX + self.x, love.mouse.getY() * self.scaleY + self.y
end

function camera:NewLayer(scale, func)
  table.insert(self.layers, { draw = func, scale = scale })
  table.sort(self.layers, function(a, b) return a.scale < b.scale end)
end

function camera:Draw()
  local bx, by = self.x, self.y

  for _, v in ipairs(self.layers) do
    self.x = bx * v.scale
    self.y = by * v.scale
    camera:set()
    v.draw()
    camera:unset()
  end
end

return camera