require("scripts/globals")

Train = {}

function Train:new ()
  o = {
    sprite = lg.newImage(imagesFolder .. "train.png"),
    x = width_window / 2,
    y = 0,
    width = 32,
    height = 32
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
