local Screen = {}

function Screen:Init(pW, pH, pVw, pVh)
  self.width = pW
  self.height = pH
  self.virtualWidth = pVw
  self.virtualHeight = pVh
  self.scaleX = self.width / self.virtualWidth
  self.scaleY = self.height / self.virtualHeight
  
  love.window.setMode(self.width, self.height)
end

return Screen