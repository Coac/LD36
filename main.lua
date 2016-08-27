require("scripts/globals")
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
local turret
local turret2


function love.load()
  lw.setTitle("LD36")
  lw.setMode(width_window, height_window, {resizable=true, vsync=false, minwidth=400, minheight=300})
  CScreen.init(width_window, height_window, true)

  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)
  --arrow = Arrow:new(300, 300, 10, 2)
  train = Train:new()
  enemyManager = EnemyManager:new()
  turret = Turret:new(lg.newImage(imagesFolder .. "turret.png"), 550, 400, 10, 2, 2)
  turret2 = Turret:new(lg.newImage(imagesFolder .. "turret.png"), 700, 400, 10, 2, 2)

  lifeBar = LifeBar:new(100, 300, 20, 100, 20)
end

function love.draw()
  CScreen.apply()

  background:draw()
  train:draw()
  enemyManager:draw()
  lifeBar:draw()
  turret:draw()
  turret2:draw()
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
  turret:update(dt)
  turret2:update(dt)
  for i, obj in ipairs(objectsToUpdate) do
    obj:update(dt)
  end

  if lk.isDown("up") then
     lifeBar:takeDamage(1)
  end

end
