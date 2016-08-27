require("scripts/globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Arrow")
require("scripts/EnemyManager")
require("scripts/LifeBar")
local CScreen = require("dependencies/CScreen")


local background
local numerobis
local arrow
local enemyManager
local lifeBar

function love.load()
  love.window.setTitle("LD36")
  love.window.setMode(width_window, height_window, {resizable=true, vsync=false, minwidth=400, minheight=300})
  CScreen.init(width_window, height_window, true)

  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)
  arrow = Arrow:new(300, 300, 10, 2)
  enemyManager = EnemyManager:new()

  lifeBar = LifeBar:new(100, 300, 20, 100, 20)
end

function love.draw()
  CScreen.apply()

  background:draw()
  numerobis:draw()
  arrow:draw()
  enemyManager:draw()
  lifeBar:draw()

  CScreen.cease()

end

function love.resize(width, height)
    CScreen.update(width, height)
end


function love.update(dt)
  background:update(dt)
  numerobis:update(dt)
  arrow:update(dt)
  enemyManager:update(dt)

  if lk.isDown("up") then
     lifeBar:takeDamage(1)
  end

end
