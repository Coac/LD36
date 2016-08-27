require("scripts/globals")

Train = {}

function Train:new ()
  spritee = lg.newImage(imagesFolder .. "charriot.png");
  o = {
    sprite = spritee,
    x = width_window / 2,
    y = height_window / 2,
    width = spritee:getWidth(),
    height = spritee:getHeight()
  }

  setmetatable(o, self)
  self.__index = self
  return o
end

function Train:draw()
    lg.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width/2, self.height/2);
end
