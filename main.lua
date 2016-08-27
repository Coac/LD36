require("scripts/globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Arrow")
require("scripts/Enemy")


local background
local numerobis
local arrow
local enemy

function love.load()
  love.window.setTitle("LD36")

  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)
  arrow = Arrow:new(300, 300, 10, 2)
  enemy = Enemy:new(lg.newImage(imagesFolder .. "enemy.png"), 300, 300, 10, 2, 2)


end

function love.draw()
  background:draw()
  numerobis:draw()
  arrow:draw()
  enemy:draw()

end


function love.update(dt)
  background:update(dt)
  numerobis:update(dt)
  arrow:update(dt)
  enemy:update(dt)

end
