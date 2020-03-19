-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

function love.load()
  -- Require Lib
  Object = require "Lib/classic"
  
  -- Init Util
  Util = require "Engine/Util"
  
  -- Load Config
  config = Util:LoadJson("Engine/config.json")
  
  -- Set the Debuger
  Debug = require "Engine/Debug"
  Debug:Start(config.debug)
  Debug:Log("----- Debug Start -----")
  
  -- Importe Classes Public
  require "/Engine/Require"
  
  -- Init GUI
  GUI = require "Engine/GUI"
  
  -- Init Camera and Screen
  Screen = require "Engine/Screen"
  Camera = require "Engine/Camera"
  Screen:Init(config.resolution.ScreenWidth, config.resolution.ScreenHeight, config.resolution.ScreenVirtualWidth, config.resolution.ScreenVirtualHeight)
  Camera:Scale(Screen.scaleX, Screen.scaleY)
  love.window.setTitle(config.title)
  
  -- Init Key
  Key = require "Engine/Key"
  
  -- Set the Begining State
  gameState = require "Engine/GameState"
  gameState:ChangeScene("Menu")
  
  Debug:Log ("Initialisation Terminer")
  Debug:Log ("----- Jeu : -----")
  gameState:ChangeScene("Gameplay")
end

function love.update(dt)
  -- Update the Scene
  gameState.currentScene:Update(dt)
end

function love.draw()
  -- Set Camera
  camera:Set()
  
  -- Draw Scene
  gameState.currentScene:Draw()
  
  -- Unset Camera
  camera:Unset()
end
