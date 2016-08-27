require("scripts/globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Arrow")
require("scripts/EnemyManager")
require("scripts/LifeBar")


local background
local numerobis
local arrow
local enemyManager
local lifeBar

function love.load()
  love.window.setTitle("LD36")

  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)
  arrow = Arrow:new(300, 300, 10, 2)
  enemyManager = EnemyManager:new()

  lifeBar = LifeBar:new(100, 300, 20, 100, 20)
end

function love.draw()
  background:draw()
  numerobis:draw()
  arrow:draw()
  enemyManager:draw()
  lifeBar:draw()

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
