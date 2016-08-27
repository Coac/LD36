require("scripts/globals")

Numerobis = {}

function Numerobis:new(_x, _y, _speed)
  local o = {
    sprite = lg.newImage(imagesFolder .. "numerobis.png"),
    x = _x,
    y = _y,
    speed =  _speed
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Numerobis:update(dt)
  if lk.isDown("right") then
     self.x = self.x + (self.speed * dt)
  end

  if lk.isDown("left") then
     self.x = self.x - (self.speed * dt)
  end

  if lk.isDown("down") then
     self.y = self.y + (self.speed * dt)
  end

  if lk.isDown("up") then
     self.y = self.y - (self.speed * dt)
  end
end

function Numerobis:draw()
  lg.draw(self.sprite, self.x, self.y);
end
