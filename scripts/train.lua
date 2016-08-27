require("scripts/globals")

Train = {}

function Train:new ()
  spritee = lg.newImage(imagesFolder .. "charriot.png");
  o = {
    sprite = spritee,
    x = width_window / 2,
    y = 0,
    width = spritee:getWidth(),
    height = spritee:getHeight()
  }

  setmetatable(o, self)
  self.__index = self
  return o
end

function Train:draw()
  for i = 0,5,1 do
    lg.draw(self.sprite, self.x, self.y + i * self.height);
  end
end
