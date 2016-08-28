require("scripts/Globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Train")
require("scripts/EnemyManager")
require("scripts/LifeBar")
require("scripts/Turret")

local CScreen = require("dependencies/CScreen")

-- Global variables :
-- enemyManager

local background
local numerobis
local arrow
local lifeBar



function love.load()
  lw.setTitle("LD36")
  lw.setMode(WINDOW_W, WINDOW_H, {resizable=true, vsync=false, minwidth=400, minheight=300})
  CScreen.init(WINDOW_W, WINDOW_H, true)

  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)
  --arrow = Arrow:new(300, 300, 10, 2)
  train = Train:new()
  enemyManager = EnemyManager:new()
  Turret:new(550, 400)
  Turret:new(700, 400)

  lifeBar = LifeBar:new(100, 300, 20, 100, 20)
end

function love.draw()
  CScreen.apply()

  background:draw()
  train:draw()
  enemyManager:draw()
  lifeBar:draw()
  for i, obj in ipairs(objectsToDraw) do
    obj:draw()
  end

  numerobis:draw()
  CScreen.cease()
end

function love.resize(width, height)
    CScreen.update(width, height)
end


function love.update(dt)
  background:update(dt)
  numerobis:update(dt)
  enemyManager:update(dt)
  for i, obj in ipairs(objectsToUpdate) do
    obj:update(dt)
  end

  if lk.isDown("up") then
     lifeBar:takeDamage(1)
  end

end
