require("scripts/BgElement")
require("scripts/Globals")

Background = {}

function Background:new()
  bgImg = lg.newImage(IMG_DIR .. "background.png")
  o = {
    elems = {
      BgElement:new(bgImg, 0, 0, 0),
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
