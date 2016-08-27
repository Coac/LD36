local lg = love.graphics
require("scripts/BgElement")

Background = {}

function Background:new()
    bgImg = love.graphics.newImage("assets/images/test.png")
  o = {
    bgEl1 = BgElement:new(bgImg, 0, 50, 50)
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Background:update(dt)
  self.bgEl1:update(dt)
end

function Background:draw()
  self.bgEl1:draw()
end
