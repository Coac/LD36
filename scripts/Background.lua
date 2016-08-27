require("scripts/BgElement")
require("scripts/globals")

Background = {}

function Background:new()
  bgImg = lg.newImage(imagesFolder .. "test.png")
  o = {
    elems = {
      BgElement:new(bgImg, 0, 50, 50),
      BgElement:new(bgImg, 0, 100, 100)
    }

   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Background:update(dt)
  for i = 1, table.getn(self.elems) do
    self.elems[i]:update(dt)
  end
end

function Background:draw()
  for i = 1, table.getn(self.elems) do
    self.elems[i]:draw()
  end
end
