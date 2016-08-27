require("scripts/globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Arrow")
require("scripts/train")

function love.load()
  lw.setTitle("LD36")
  lw.setMode(width_window, height_window, {centered=true})

  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)
  arrow = Arrow:new(300, 300, 10, 2)
  train = Train:new()
end

function love.draw()
  background:draw()
  numerobis:draw()
  arrow:draw()
  train:draw()
end


function love.update(dt)
  background:update(dt)
  numerobis:update(dt)
  arrow:update(dt)
end
