require("scripts/globals")

Train = {}

function Train:new ()
  spritee = lg.newImage(IMG_DIR .. "charriot.png");
  o = {
    sprite = spritee,
    x = WINDOW_W / 2,
    y = WINDOW_H / 2,
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
