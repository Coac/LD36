require("scripts/BgElement")
require("scripts/globals")

Background = {}

function Background:new()
  bgImg = lg.newImage(imagesFolder .. "background.png")
  o = {
    elems = {
      BgElement:new(bgImg, 0, 0, 0),
      BgElement:new(bgImg, 0, 100, 100)
    }

   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Background:update(dt)
  for i, elem in ipairs(self.elems) do
    elem:update(dt)
  end
end

function Background:draw()
  for i, elem in ipairs(self.elems) do
    elem:draw()
  end
end
