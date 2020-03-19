local GameState = {}

function GameState:new()
  self.currentScene = Scene()
end

function GameState:ChangeScene(pScene)
  find = false
  if self.currentScene ~= nil then self.currentScene:UnLoad() end
  
  if pScene == "Gameplay" then
      self.currentScene = SceneGameplay()
      find = true
  end
  if pScene == "Menu" then
      self.currentScene = SceneMenu()
      find = true
  end
  
  if find == false then 
    Debug:Error("Scene "..pScene.." is not a scene") 
  else
    Debug:Log("Changement de Scene : "..pScene)
  end
  
  self.currentScene:Init()
end

return GameState