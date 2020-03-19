Map = Object:extend()

function Map:new(pMap, pTexture)
  self.widht = pMap.width
  self.height = pMap.height
  self.tileWidth = pMap.tilewidth
  self.tileHeight = pMap.tileheight
  self.tileSet = pMap.tilesets[1]
  self.lstLayer = pMap.layers
  self.texture = pTexture
  self:SetTexture(pTexture)
  
  self.scale = 1
end

function Map:SetTexture(pTexture)
  self.lstTexture = {}
  x,y = 0,0
  for i = 1, self.tileSet.tilecount do
    table.insert(self.lstTexture, love.graphics.newQuad(x,y,self.tileWidth, self.tileHeight, self.texture:getDimensions()))
    x = x + self.tileWidth
    if x >= self.texture:getWidth() then
      y = y + self.tileHeight
      x = 0
    end
  end
  
end

function Map:Draw()
  for k,v in pairs(self.lstLayer) do
    layer = v
    x,y = 0,0
    for l = 1, layer.height do
      for c = 1, layer.width do
        love.graphics.draw(self.texture, self.lstTexture[layer.data[c + (l-1) * layer.width]], x, y, 0, self.scale, self.scale)
        
        x = x +self.tileWidth * self.scale
      end
      y = y + self.tileHeight * self.scale
      x = 0
    end
  end
end