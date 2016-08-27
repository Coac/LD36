require("scripts/globals")

local Enemy = {}

function Enemy:new(_sprite, _x, _y, _speedY,_angle)
  o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speedY =  _speedY
    angle =  _angle
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Enemy:update(dt)
  self.x = self.x + self.speed * dt * math.cos(self.angle)
  self.y = self.y + self.speed * dt * math.sin(self.angle)
end

function Enemy:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle);
end

return enemy
