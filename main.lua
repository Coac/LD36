require("scripts/Globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Train")
require("scripts/EnemyManager")
require("scripts/LifeBar")
require("scripts/Turret")
require("scripts/MenuTurret")

local CScreen = require("dependencies/CScreen")

-- Global variables :
-- enemyManager
-- lifeBar
local background
local numerobis
local arrow
local bgUI

function love.load()
  lw.setTitle("LD36")
  lw.setMode(WINDOW_W, WINDOW_H, {resizable=true, vsync=false, minwidth=400, minheight=300})
  CScreen.init(WINDOW_W, WINDOW_H, true)

  lg.setNewFont(FONTS_DIR .."Myth.ttf", 40)
  bgUI = lg.newImage(IMG_DIR .. "bgUIingame.png")

  background = Background:new()
  numerobis = Numerobis:new(WINDOW_W / 2, WINDOW_H / 2, 300)
  train = Train:new()
  enemyManager = EnemyManager:new()
  Turret:new(550, 400)
  Turret:new(700, 400)

  lifeBar = LifeBar:new(100, 300, 50, WINDOW_W / 2 - 300/2, 30)
end

function love.draw()
  CScreen.apply()

  background:draw()
  train:draw()
  enemyManager:draw()
  for i, obj in ipairs(objectsToDraw) do
    obj:draw()
  end
  numerobis:draw()

  lg.draw(bgUI, WINDOW_W/2, 0, 0, 1, 1, bgUI:getWidth()/2, 0)
  lifeBar:draw()
  lg.print({{0,0,0,255}, "Score : " .. score},  50, 30)
  lg.print({{0,0,0,255}, "Money : " .. money}, 900, 30)


  CScreen.cease()
end

function love.resize(width, height)
    CScreen.update(width, height)
end


function love.update(dt)
  background:update(dt)
  numerobis:update(dt)
  enemyManager:update(dt)
  train:update(dt)
  for i, obj in ipairs(objectsToUpdate) do
    obj:update(dt)
  end
end
